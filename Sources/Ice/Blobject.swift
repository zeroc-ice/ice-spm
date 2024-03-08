//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import Foundation
import PromiseKit

/// Base protocol for dynamic dispatch servants.
public protocol Blobject {
    /// Dispatch an incoming request.
    ///
    /// - parameter inEncaps: `Data` - The encoded in-parameters for the operation.
    ///
    /// - parameter current: `Ice.Current` - The Current object to pass to the operation.
    ///
    /// - returns: `(ok: Bool, outParams: Data)` - A tuple with the following fields:
    ///
    ///   - ok: `Bool` - True if the operation completed successfully, false if
    ///     the operation raised a user exception (in this case, outParams
    ///     contains the encoded user exception). If the operation raises an
    ///     Ice run-time exception, it must throw it directly.
    ///
    ///   - outParams: `Data` - The encoded out-paramaters and return value
    ///     for the operation. The return value follows any out-parameters.
    func ice_invoke(inEncaps: Data, current: Current) throws -> (ok: Bool, outParams: Data)
}

/// Request dispatcher for Blobject servants.
public struct BlobjectDisp: Disp {
    public let servant: Blobject

    public init(_ servant: Blobject) {
        self.servant = servant
    }

    public func dispatch(request: Request, current: Current) throws -> Promise<OutputStream>? {
        let inEncaps = try request.readParamEncaps()
        let invokeResult = try servant.ice_invoke(inEncaps: inEncaps, current: current)
        return request.setResult(request.writeParamEncaps(ok: invokeResult.ok, outParams: invokeResult.outParams))
    }
}
