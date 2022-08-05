//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.8
//
// <auto-generated>
//
// Generated from file `Process.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation
import PromiseKit

/// Traits for Slice interface `Process`.
public struct ProcessTraits: SliceTraits {
    public static let staticIds = ["::Ice::Object", "::Ice::Process"]
    public static let staticId = "::Ice::Process"
}

/// An administrative interface for process management. Managed servers must
/// implement this interface.
///
/// A servant implementing this interface is a potential target
/// for denial-of-service attacks, therefore proper security precautions
/// should be taken. For example, the servant can use a UUID to make its
/// identity harder to guess, and be registered in an object adapter with
/// a secured endpoint.
///
/// ProcessPrx Methods:
///
///  - shutdown: Initiate a graceful shut-down.
///
///  - shutdownAsync: Initiate a graceful shut-down.
///
///  - writeMessage: Write a message on the process' stdout or stderr.
///
///  - writeMessageAsync: Write a message on the process' stdout or stderr.
public protocol ProcessPrx: ObjectPrx {}

internal final class ProcessPrxI: ObjectPrxI, ProcessPrx {
    public override class func ice_staticId() -> Swift.String {
        return ProcessTraits.staticId
    }
}

/// Casts a proxy to the requested type. This call contacts the server and verifies that the object
/// implements this type.
///
/// It will throw a local exception if a communication error occurs. You can optionally supply a
/// facet name and a context map.
///
/// - parameter prx: `Ice.ObjectPrx` - The proxy to be cast.
///
/// - parameter type: `ProcessPrx.Protocol` - The proxy type to cast to.
///
/// - parameter facet: `String` - The optional name of the desired facet.
///
/// - parameter context: `Ice.Context` The optional context dictionary for the remote invocation.
///
/// - returns: `ProcessPrx` - A proxy with the requested type or nil if the objet does not
///   support this type.
///
/// - throws: `Ice.LocalException` if a communication error occurs.
public func checkedCast(prx: ObjectPrx, type: ProcessPrx.Protocol, facet: Swift.String? = nil, context: Context? = nil) throws -> ProcessPrx? {
    return try ProcessPrxI.checkedCast(prx: prx, facet: facet, context: context) as ProcessPrxI?
}

/// Downcasts the given proxy to this type without contacting the remote server.
///
/// - parameter prx: `Ice.ObjectPrx` The proxy to be cast.
///
/// - parameter type: `ProcessPrx.Protocol` - The proxy type to cast to.
///
/// - parameter facet: `String` - The optional name of the desired facet
///
/// - returns: `ProcessPrx` - A proxy with the requested type
public func uncheckedCast(prx: ObjectPrx, type: ProcessPrx.Protocol, facet: Swift.String? = nil) -> ProcessPrx {
    return ProcessPrxI.uncheckedCast(prx: prx, facet: facet) as ProcessPrxI
}

/// Returns the Slice type id of the interface or class associated with this proxy type.
///
/// parameter type: `ProcessPrx.Protocol` -  The proxy type to retrieve the type id.
///
/// returns: `String` - The type id of the interface or class associated with this proxy type.
public func ice_staticId(_ type: ProcessPrx.Protocol) -> Swift.String {
    return ProcessTraits.staticId
}

/// Extension to `Ice.InputStream` class to support reading proxy of type
/// `ProcessPrx`.
public extension InputStream {
    /// Extracts a proxy from the stream. The stream must have been initialized with a communicator.
    ///
    /// - parameter type: `ProcessPrx.Protocol` - The type of the proxy to be extracted.
    ///
    /// - returns: `ProcessPrx?` - The extracted proxy
    func read(_ type: ProcessPrx.Protocol) throws -> ProcessPrx? {
        return try read() as ProcessPrxI?
    }
    /// Extracts a proxy from the stream. The stream must have been initialized with a communicator.
    ///
    /// - parameter tag: `Int32` - The numeric tag associated with the value.
    ///
    /// - parameter type: `ProcessPrx.Protocol` - The type of the proxy to be extracted.
    ///
    /// - returns: `ProcessPrx` - The extracted proxy.
    func read(tag: Swift.Int32, type: ProcessPrx.Protocol) throws -> ProcessPrx? {
        return try read(tag: tag) as ProcessPrxI?
    }
}

/// An administrative interface for process management. Managed servers must
/// implement this interface.
///
/// A servant implementing this interface is a potential target
/// for denial-of-service attacks, therefore proper security precautions
/// should be taken. For example, the servant can use a UUID to make its
/// identity harder to guess, and be registered in an object adapter with
/// a secured endpoint.
///
/// ProcessPrx Methods:
///
///  - shutdown: Initiate a graceful shut-down.
///
///  - shutdownAsync: Initiate a graceful shut-down.
///
///  - writeMessage: Write a message on the process' stdout or stderr.
///
///  - writeMessageAsync: Write a message on the process' stdout or stderr.
public extension ProcessPrx {
    /// Initiate a graceful shut-down.
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    func shutdown(context: Context? = nil) throws {
        try _impl._invoke(operation: "shutdown",
                          mode: .Normal,
                          context: context)
    }

    /// Initiate a graceful shut-down.
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    ///
    /// - parameter sentOn: `Dispatch.DispatchQueue?` - Optional dispatch queue used to
    ///   dispatch the sent callback.
    ///
    /// - parameter sentFlags: `Dispatch.DispatchWorkItemFlags?` - Optional dispatch flags used
    ///   to dispatch the sent callback
    ///
    /// - parameter sent: `((Swift.Bool) -> Swift.Void)` - Optional sent callback.
    ///
    /// - returns: `PromiseKit.Promise<>` - The result of the operation
    func shutdownAsync(context: Context? = nil, sentOn: Dispatch.DispatchQueue? = nil, sentFlags: Dispatch.DispatchWorkItemFlags? = nil, sent: ((Swift.Bool) -> Swift.Void)? = nil) -> PromiseKit.Promise<Swift.Void> {
        return _impl._invokeAsync(operation: "shutdown",
                                  mode: .Normal,
                                  context: context,
                                  sentOn: sentOn,
                                  sentFlags: sentFlags,
                                  sent: sent)
    }

    /// Write a message on the process' stdout or stderr.
    ///
    /// - parameter message: `Swift.String` The message.
    ///
    /// - parameter fd: `Swift.Int32` 1 for stdout, 2 for stderr.
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    func writeMessage(message iceP_message: Swift.String, fd iceP_fd: Swift.Int32, context: Context? = nil) throws {
        try _impl._invoke(operation: "writeMessage",
                          mode: .Normal,
                          write: { ostr in
                              ostr.write(iceP_message)
                              ostr.write(iceP_fd)
                          },
                          context: context)
    }

    /// Write a message on the process' stdout or stderr.
    ///
    /// - parameter message: `Swift.String` The message.
    ///
    /// - parameter fd: `Swift.Int32` 1 for stdout, 2 for stderr.
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    ///
    /// - parameter sentOn: `Dispatch.DispatchQueue?` - Optional dispatch queue used to
    ///   dispatch the sent callback.
    ///
    /// - parameter sentFlags: `Dispatch.DispatchWorkItemFlags?` - Optional dispatch flags used
    ///   to dispatch the sent callback
    ///
    /// - parameter sent: `((Swift.Bool) -> Swift.Void)` - Optional sent callback.
    ///
    /// - returns: `PromiseKit.Promise<>` - The result of the operation
    func writeMessageAsync(message iceP_message: Swift.String, fd iceP_fd: Swift.Int32, context: Context? = nil, sentOn: Dispatch.DispatchQueue? = nil, sentFlags: Dispatch.DispatchWorkItemFlags? = nil, sent: ((Swift.Bool) -> Swift.Void)? = nil) -> PromiseKit.Promise<Swift.Void> {
        return _impl._invokeAsync(operation: "writeMessage",
                                  mode: .Normal,
                                  write: { ostr in
                                      ostr.write(iceP_message)
                                      ostr.write(iceP_fd)
                                  },
                                  context: context,
                                  sentOn: sentOn,
                                  sentFlags: sentFlags,
                                  sent: sent)
    }
}


/// Dispatcher for `Process` servants.
public struct ProcessDisp: Disp {
    public let servant: Process
    private static let defaultObject = ObjectI<ProcessTraits>()

    public init(_ servant: Process) {
        self.servant = servant
    }

    public func dispatch(request: Request, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        request.startOver()
        switch current.operation {
        case "ice_id":
            return try (servant as? Object ?? ProcessDisp.defaultObject)._iceD_ice_id(incoming: request, current: current)
        case "ice_ids":
            return try (servant as? Object ?? ProcessDisp.defaultObject)._iceD_ice_ids(incoming: request, current: current)
        case "ice_isA":
            return try (servant as? Object ?? ProcessDisp.defaultObject)._iceD_ice_isA(incoming: request, current: current)
        case "ice_ping":
            return try (servant as? Object ?? ProcessDisp.defaultObject)._iceD_ice_ping(incoming: request, current: current)
        case "shutdown":
            return try servant._iceD_shutdown(incoming: request, current: current)
        case "writeMessage":
            return try servant._iceD_writeMessage(incoming: request, current: current)
        default:
            throw OperationNotExistException(id: current.id, facet: current.facet, operation: current.operation)
        }
    }
}

/// An administrative interface for process management. Managed servers must
/// implement this interface.
///
/// A servant implementing this interface is a potential target
/// for denial-of-service attacks, therefore proper security precautions
/// should be taken. For example, the servant can use a UUID to make its
/// identity harder to guess, and be registered in an object adapter with
/// a secured endpoint.
public protocol Process {
    /// Initiate a graceful shut-down.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    func shutdown(current: Current) throws

    /// Write a message on the process' stdout or stderr.
    ///
    /// - parameter message: `Swift.String` The message.
    ///
    /// - parameter fd: `Swift.Int32` 1 for stdout, 2 for stderr.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    func writeMessage(message: Swift.String, fd: Swift.Int32, current: Current) throws
}

/// An administrative interface for process management. Managed servers must
/// implement this interface.
///
/// A servant implementing this interface is a potential target
/// for denial-of-service attacks, therefore proper security precautions
/// should be taken. For example, the servant can use a UUID to make its
/// identity harder to guess, and be registered in an object adapter with
/// a secured endpoint.
///
/// Process Methods:
///
///  - shutdown: Initiate a graceful shut-down.
///
///  - writeMessage: Write a message on the process' stdout or stderr.
public extension Process {
    func _iceD_shutdown(incoming inS: Incoming, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        try inS.readEmptyParams()

        try self.shutdown(current: current)

        return inS.setResult()
    }

    func _iceD_writeMessage(incoming inS: Incoming, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        let (iceP_message, iceP_fd): (Swift.String, Swift.Int32) = try inS.read { istr in
            let iceP_message: Swift.String = try istr.read()
            let iceP_fd: Swift.Int32 = try istr.read()
            return (iceP_message, iceP_fd)
        }

        try self.writeMessage(message: iceP_message, fd: iceP_fd, current: current)

        return inS.setResult()
    }
}
