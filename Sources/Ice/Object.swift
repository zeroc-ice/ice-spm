//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import IceImpl
import PromiseKit

/// Request is an opaque type that represents an incoming request.
public typealias Request = Incoming

/// A request dispatcher (Disp) is a helper struct used by object adapters to dispatch
/// requests to servants.
public protocol Disp {
    /// Dispatch request to servant.
    ///
    /// - parameter request: `Ice.Request` - The incoming request.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    func dispatch(request: Request, current: Current) throws -> Promise<OutputStream>?
}

/// A SliceTraits struct describes a Slice interface, class or exception.
public protocol SliceTraits {
    /// List of all type-ids.
    static var staticIds: [String] { get }

    /// Most derived type-id.
    static var staticId: String { get }
}

/// The base class for servants.
public protocol Object {
    /// Returns the Slice type ID of the most-derived interface supported by this object.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    ///
    /// - returns: `String` - The Slice type ID of the most-derived interface.
    func ice_id(current: Current) throws -> String

    /// Returns the Slice type IDs of the interfaces supported by this object.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    ///
    /// - returns: `[String]` The Slice type IDs of the interfaces supported by this object, in base-to-derived
    ///   order. The first element of the returned array is always `::Ice::Object`.
    func ice_ids(current: Current) throws -> [String]

    /// Tests whether this object supports a specific Slice interface.
    ///
    /// - parameter s: `String` - The type ID of the Slice interface to test against.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    ///
    /// - returns: `Bool` - True if this object has the interface specified by s or
    ///   derives from the interface specified by s.
    func ice_isA(id: String, current: Current) throws -> Bool

    /// Tests whether this object can be reached.
    ///
    /// - parameter current: The Current object for the dispatch.
    func ice_ping(current: Current) throws
}

public extension Object {
    func _iceD_ice_id(incoming inS: Incoming, current: Current) throws -> Promise<OutputStream>? {
        try inS.readEmptyParams()

        let returnValue = try ice_id(current: current)

        return inS.setResult { ostr in
            ostr.write(returnValue)
        }
    }

    func _iceD_ice_ids(incoming inS: Incoming, current: Current) throws -> Promise<OutputStream>? {
        try inS.readEmptyParams()

        let returnValue = try ice_ids(current: current)

        return inS.setResult { ostr in
            ostr.write(returnValue)
        }
    }

    func _iceD_ice_isA(incoming inS: Incoming, current: Current) throws -> Promise<OutputStream>? {
        let ident: String = try inS.read { istr in
            try istr.read()
        }

        let returnValue = try ice_isA(id: ident, current: current)

        return inS.setResult { ostr in
            ostr.write(returnValue)
        }
    }

    func _iceD_ice_ping(incoming inS: Incoming, current: Current) throws -> Promise<OutputStream>? {
        try inS.readEmptyParams()
        try ice_ping(current: current)
        return inS.setResult()
    }
}

/// Traits for Object.
public struct ObjectTraits: SliceTraits {
    public static let staticIds = ["::Ice::Object"]
    public static let staticId = "::Ice::Object"
}

/// class ObjectI provides the default implementation of Object operations (ice_id,
/// ice_ping etc.) for a given Slice interface.
open class ObjectI<T: SliceTraits>: Object {
    public init() {}

    open func ice_id(current _: Current) throws -> String {
        return T.staticId
    }

    open func ice_ids(current _: Current) throws -> [String] {
        return T.staticIds
    }

    open func ice_isA(id: String, current _: Current) throws -> Bool {
        return T.staticIds.contains(id)
    }

    open func ice_ping(current _: Current) throws {
        // Do nothing
    }
}

/// Request dispatcher for plain Object servants.
public struct ObjectDisp: Disp {
    public let servant: Object

    public init(_ servant: Object) {
        self.servant = servant
    }

    public func dispatch(request: Request, current: Current) throws -> Promise<OutputStream>? {
        switch current.operation {
        case "ice_id":
            return try servant._iceD_ice_id(incoming: request, current: current)
        case "ice_ids":
            return try servant._iceD_ice_ids(incoming: request, current: current)
        case "ice_isA":
            return try servant._iceD_ice_isA(incoming: request, current: current)
        case "ice_ping":
            return try servant._iceD_ice_ping(incoming: request, current: current)
        default:
            throw OperationNotExistException(id: current.id, facet: current.facet, operation: current.operation)
        }
    }
}
