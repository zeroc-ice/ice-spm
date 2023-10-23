//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import Foundation
import IceImpl
import PromiseKit

public final class Incoming {
    private let current: Current
    private var format: FormatType
    private let istr: InputStream
    private let responseCallback: ICEBlobjectResponse
    private let exceptionCallback: ICEBlobjectException

    private var servant: Disp?
    private var locator: ServantLocator?
    private var cookie: AnyObject?

    private var ostr: OutputStream! // must be set before calling responseCallback
    private var ok: Bool // false if response contains a UserException

    init(istr: InputStream, response: @escaping ICEBlobjectResponse, exception: @escaping ICEBlobjectException,
         current: Current) {
        self.istr = istr
        format = .DefaultFormat
        ok = true
        responseCallback = response
        exceptionCallback = exception
        self.current = current
    }

    public func readEmptyParams() throws {
        //
        // Remember the encoding used by the input parameters, we'll
        // encode the response parameters with the same encoding.
        //
        current.encoding = try istr.skipEmptyEncapsulation()
    }

    public func readParamEncaps() throws -> Data {
        let params = try istr.readEncapsulation()
        current.encoding = params.encoding
        return params.bytes
    }

    public func read<T>(_ cb: (InputStream) throws -> T) throws -> T {
        //
        // Remember the encoding used by the input parameters, we'll
        // encode the response parameters with the same encoding.
        //
        current.encoding = try istr.startEncapsulation()
        let l = try cb(istr)
        try istr.endEncapsulation()
        return l
    }

    public func startOver() {
        istr.startOver()
        ostr = nil
    }

    public func writeParamEncaps(ok: Bool, outParams: Data) -> OutputStream {
        let ostr = OutputStream(communicator: istr.communicator, encoding: current.encoding)
        if outParams.isEmpty {
            ostr.writeEmptyEncapsulation(current.encoding)
        } else {
            ostr.writeEncapsulation(outParams)
        }
        self.ok = ok

        return ostr
    }

    public func response() {
        guard locator == nil || servantLocatorFinished() else {
            return
        }
        precondition(ostr != nil, "OutputStream was not set before calling response()")
        ostr.finished().withUnsafeBytes {
            responseCallback(ok, $0.baseAddress!, $0.count)
        }
    }

    public func exception(_ ex: Error) {
        guard locator == nil || servantLocatorFinished() else {
            return
        }
        handleException(ex)
    }

    public func setFormat(_ format: FormatType) {
        self.format = format
    }

    @discardableResult
    public func setResult(_ os: OutputStream) -> Promise<OutputStream>? {
        ostr = os
        return nil // Response is cached in the Incoming to not have to create unnecessary promise
    }

    public func setResult() -> Promise<OutputStream>? {
        let ostr = OutputStream(communicator: istr.communicator)
        ostr.writeEmptyEncapsulation(current.encoding)
        self.ostr = ostr
        return nil // Response is cached in the Incoming to not have to create unnecessary future
    }

    public func setResult(_ cb: (OutputStream) -> Void) -> Promise<OutputStream>? {
        let ostr = OutputStream(communicator: istr.communicator)
        ostr.startEncapsulation(encoding: current.encoding, format: format)
        cb(ostr)
        ostr.endEncapsulation()
        self.ostr = ostr
        return nil // Response is cached in the Incoming to not have to create unnecessary future
    }

    public func setResultPromise(_ p: Promise<Void>) -> Promise<OutputStream> {
        // Use the thread which fulfilled the promise (on: nil)
        return p.map(on: nil) {
            let ostr = OutputStream(communicator: self.istr.communicator)
            ostr.writeEmptyEncapsulation(self.current.encoding)
            return ostr
        }
    }

    public func setResultPromise<T>(_ p: Promise<T>,
                                    _ cb: @escaping (OutputStream, T) -> Void) -> Promise<OutputStream> {
        // Use the thread which fulfilled the promise (on: nil)
        return p.map(on: nil) { t in
            let ostr = OutputStream(communicator: self.istr.communicator)
            ostr.startEncapsulation(encoding: self.current.encoding, format: self.format)
            cb(ostr, t)
            ostr.endEncapsulation()
            return ostr
        }
    }

    func servantLocatorFinished() -> Bool {
        guard let locator = locator, let servant = servant else {
            preconditionFailure()
        }

        do {
            try locator.finished(curr: current, servant: servant, cookie: cookie)
            return true
        } catch {
            handleException(error)
        }

        return false
    }

    func invoke(_ servantManager: ServantManager) {
        servant = servantManager.findServant(id: current.id, facet: current.facet)

        if servant == nil {
            locator = servantManager.findServantLocator(category: current.id.category)

            if locator == nil, !current.id.category.isEmpty {
                locator = servantManager.findServantLocator(category: "")
            }

            if let locator = locator {
                do {
                    let locatorReturn = try locator.locate(current)
                    (servant, cookie) = (locatorReturn.returnValue, locatorReturn.cookie)
                } catch {
                    handleException(error)
                    return
                }
            }
        }

        guard let s = servant else {
            do {
                if servantManager.hasServant(id: current.id) || servantManager.isAdminId(current.id) {
                    throw FacetNotExistException(id: current.id, facet: current.facet, operation: current.operation)
                } else {
                    throw ObjectNotExistException(id: current.id, facet: current.facet, operation: current.operation)
                }
            } catch {
                exceptionCallback(convertException(error))
                return
            }
        }

        //
        // Dispatch in the incoming call
        //
        do {
            // Request was dispatched asynchronously if promise is non-nil
            if let promise = try s.dispatch(request: self, current: current) {
                // Use the thread which fulfilled the promise (on: nil)
                promise.done(on: nil) { ostr in
                    self.ostr = ostr
                    self.response()
                }.catch(on: nil) { error in
                    self.exception(error)
                }
            } else {
                response()
            }
        } catch {
            exception(error)
        }
    }

    func handleException(_ exception: Error) {
        guard let e = exception as? UserException else {
            exceptionCallback(convertException(exception))
            return
        }
        ok = false // response will contain a UserException
        let ostr = OutputStream(communicator: istr.communicator)
        ostr.startEncapsulation(encoding: current.encoding, format: format)
        ostr.write(e)
        ostr.endEncapsulation()
        ostr.finished().withUnsafeBytes {
            responseCallback(ok, $0.baseAddress!, $0.count)
        }
    }

    func convertException(_ exception: Error) -> ICERuntimeException {
        //
        // 1. run-time exceptions that travel over the wire
        // 2. other LocalExceptions and UserExceptions
        // 3. all other exceptions are LocalException
        //
        switch exception {
        // 1. Known run-time exceptions
        case let exception as ObjectNotExistException:
            let e = ICEObjectNotExistException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.name = exception.id.name
            e.category = exception.id.category
            e.facet = exception.facet
            e.operation = exception.operation
            return e
        case let exception as FacetNotExistException:
            let e = ICEFacetNotExistException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.name = exception.id.name
            e.category = exception.id.category
            e.facet = exception.facet
            e.operation = exception.operation
            return e
        case let exception as OperationNotExistException:
            let e = ICEOperationNotExistException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.name = exception.id.name
            e.category = exception.id.category
            e.facet = exception.facet
            e.operation = exception.operation
            return e
        case let exception as UnknownUserException:
            let e = ICEUnknownUserException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.unknown = exception.unknown
            return e
        case let exception as UnknownLocalException:
            let e = ICEUnknownLocalException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.unknown = exception.unknown
            return e
        case let exception as UnknownException:
            let e = ICEUnknownException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.unknown = exception.unknown
            return e
        // 2. Other LocalExceptions and UserExceptions
        case let exception as LocalException:
            let e = ICEUnknownLocalException()
            e.file = exception.file
            e.line = Int32(exception.line)
            e.unknown = "\(exception)"
            return e
        case let exception as UserException:
            let e = ICEUnknownUserException()
            e.unknown = "\(exception.ice_id())"
            return e
        // 3. Unknown exceptions
        default:
            let e = ICEUnknownException()
            e.file = #file
            e.line = Int32(#line)
            e.unknown = "\(exception)"
            return e
        }
    }
}
