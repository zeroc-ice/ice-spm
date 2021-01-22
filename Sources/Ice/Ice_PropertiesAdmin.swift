//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.5
//
// <auto-generated>
//
// Generated from file `PropertiesAdmin.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation
import PromiseKit

/// A simple collection of properties, represented as a dictionary of
/// key/value pairs. Both key and value are strings.
public typealias PropertyDict = [Swift.String: Swift.String]

/// Helper class to read and write `PropertyDict` dictionary values from
/// `Ice.InputStream` and `Ice.OutputStream`.
public struct PropertyDictHelper {
    /// Read a `PropertyDict` dictionary from the stream.
    ///
    /// - parameter istr: `Ice.InputStream` - The stream to read from.
    ///
    /// - returns: `PropertyDict` - The dictionary read from the stream.
    public static func read(from istr: InputStream) throws -> PropertyDict {
        let sz = try Swift.Int(istr.readSize())
        var v = PropertyDict()
        for _ in 0 ..< sz {
            let key: Swift.String = try istr.read()
            let value: Swift.String = try istr.read()
            v[key] = value
        }
        return v
    }
    /// Read an optional `PropertyDict?` dictionary from the stream.
    ///
    /// - parameter istr: `Ice.InputStream` - The stream to read from.
    ///
    /// - parameter tag: `Int32` - The numeric tag associated with the value.
    ///
    /// - returns: `PropertyDict` - The dictionary read from the stream.
    public static func read(from istr: InputStream, tag: Swift.Int32) throws -> PropertyDict? {
        guard try istr.readOptional(tag: tag, expectedFormat: .FSize) else {
            return nil
        }
        try istr.skip(4)
        return try read(from: istr)
    }

    /// Wite a `PropertyDict` dictionary to the stream.
    ///
    /// - parameter ostr: `Ice.OuputStream` - The stream to write to.
    ///
    /// - parameter value: `PropertyDict` - The dictionary value to write to the stream.
    public static func write(to ostr: OutputStream, value v: PropertyDict) {
        ostr.write(size: v.count)
        for (key, value) in v {
            ostr.write(key)
            ostr.write(value)
        }
    }

    /// Wite an optional `PropertyDict?` dictionary to the stream.
    ///
    /// - parameter ostr: `Ice.OuputStream` - The stream to write to.
    ///
    /// - parameter tag: `Int32` - The numeric tag associated with the value.
    ///
    /// - parameter value: `PropertyDict` - The dictionary value to write to the stream.
    public static func write(to ostr: OutputStream, tag: Swift.Int32, value v: PropertyDict?) {
        guard let val = v else {
            return
        }
        if ostr.writeOptional(tag: tag, format: .FSize) {
            let pos = ostr.startSize()
            write(to: ostr, value: val)
            ostr.endSize(position: pos)
        }
    }
}

/// Traits for Slice interface `PropertiesAdmin`.
public struct PropertiesAdminTraits: SliceTraits {
    public static let staticIds = ["::Ice::Object", "::Ice::PropertiesAdmin"]
    public static let staticId = "::Ice::PropertiesAdmin"
}

/// The PropertiesAdmin interface provides remote access to the properties
/// of a communicator.
///
/// PropertiesAdminPrx Methods:
///
///  - getProperty: Get a property by key.
///
///  - getPropertyAsync: Get a property by key.
///
///  - getPropertiesForPrefix: Get all properties whose keys begin with prefix.
///
///  - getPropertiesForPrefixAsync: Get all properties whose keys begin with prefix.
///
///  - setProperties: Update the communicator's properties with the given property set.
///
///  - setPropertiesAsync: Update the communicator's properties with the given property set.
public protocol PropertiesAdminPrx: ObjectPrx {}

internal final class PropertiesAdminPrxI: ObjectPrxI, PropertiesAdminPrx {
    public override class func ice_staticId() -> Swift.String {
        return PropertiesAdminTraits.staticId
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
/// - parameter type: `PropertiesAdminPrx.Protocol` - The proxy type to cast to.
///
/// - parameter facet: `String` - The optional name of the desired facet.
///
/// - parameter context: `Ice.Context` The optional context dictionary for the remote invocation.
///
/// - returns: `PropertiesAdminPrx` - A proxy with the requested type or nil if the objet does not
///   support this type.
///
/// - throws: `Ice.LocalException` if a communication error occurs.
public func checkedCast(prx: ObjectPrx, type: PropertiesAdminPrx.Protocol, facet: Swift.String? = nil, context: Context? = nil) throws -> PropertiesAdminPrx? {
    return try PropertiesAdminPrxI.checkedCast(prx: prx, facet: facet, context: context) as PropertiesAdminPrxI?
}

/// Downcasts the given proxy to this type without contacting the remote server.
///
/// - parameter prx: `Ice.ObjectPrx` The proxy to be cast.
///
/// - parameter type: `PropertiesAdminPrx.Protocol` - The proxy type to cast to.
///
/// - parameter facet: `String` - The optional name of the desired facet
///
/// - returns: `PropertiesAdminPrx` - A proxy with the requested type
public func uncheckedCast(prx: ObjectPrx, type: PropertiesAdminPrx.Protocol, facet: Swift.String? = nil) -> PropertiesAdminPrx {
    return PropertiesAdminPrxI.uncheckedCast(prx: prx, facet: facet) as PropertiesAdminPrxI
}

/// Returns the Slice type id of the interface or class associated with this proxy type.
///
/// parameter type: `PropertiesAdminPrx.Protocol` -  The proxy type to retrieve the type id.
///
/// returns: `String` - The type id of the interface or class associated with this proxy type.
public func ice_staticId(_ type: PropertiesAdminPrx.Protocol) -> Swift.String {
    return PropertiesAdminTraits.staticId
}

/// Extension to `Ice.InputStream` class to support reading proxy of type
/// `PropertiesAdminPrx`.
public extension InputStream {
    /// Extracts a proxy from the stream. The stream must have been initialized with a communicator.
    ///
    /// - parameter type: `PropertiesAdminPrx.Protocol` - The type of the proxy to be extracted.
    ///
    /// - returns: `PropertiesAdminPrx?` - The extracted proxy
    func read(_ type: PropertiesAdminPrx.Protocol) throws -> PropertiesAdminPrx? {
        return try read() as PropertiesAdminPrxI?
    }
    /// Extracts a proxy from the stream. The stream must have been initialized with a communicator.
    ///
    /// - parameter tag: `Int32` - The numeric tag associated with the value.
    ///
    /// - parameter type: `PropertiesAdminPrx.Protocol` - The type of the proxy to be extracted.
    ///
    /// - returns: `PropertiesAdminPrx` - The extracted proxy.
    func read(tag: Swift.Int32, type: PropertiesAdminPrx.Protocol) throws -> PropertiesAdminPrx? {
        return try read(tag: tag) as PropertiesAdminPrxI?
    }
}

/// The PropertiesAdmin interface provides remote access to the properties
/// of a communicator.
///
/// PropertiesAdminPrx Methods:
///
///  - getProperty: Get a property by key.
///
///  - getPropertyAsync: Get a property by key.
///
///  - getPropertiesForPrefix: Get all properties whose keys begin with prefix.
///
///  - getPropertiesForPrefixAsync: Get all properties whose keys begin with prefix.
///
///  - setProperties: Update the communicator's properties with the given property set.
///
///  - setPropertiesAsync: Update the communicator's properties with the given property set.
public extension PropertiesAdminPrx {
    /// Get a property by key. If the property is not set, an empty
    /// string is returned.
    ///
    /// - parameter _: `Swift.String` The property key.
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    ///
    /// - returns: `Swift.String` - The property value.
    func getProperty(_ iceP_key: Swift.String, context: Context? = nil) throws -> Swift.String {
        return try _impl._invoke(operation: "getProperty",
                                 mode: .Normal,
                                 write: { ostr in
                                     ostr.write(iceP_key)
                                 },
                                 read: { istr in
                                     let iceP_returnValue: Swift.String = try istr.read()
                                     return iceP_returnValue
                                 },
                                 context: context)
    }

    /// Get a property by key. If the property is not set, an empty
    /// string is returned.
    ///
    /// - parameter _: `Swift.String` The property key.
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
    /// - returns: `PromiseKit.Promise<Swift.String>` - The result of the operation
    func getPropertyAsync(_ iceP_key: Swift.String, context: Context? = nil, sentOn: Dispatch.DispatchQueue? = nil, sentFlags: Dispatch.DispatchWorkItemFlags? = nil, sent: ((Swift.Bool) -> Swift.Void)? = nil) -> PromiseKit.Promise<Swift.String> {
        return _impl._invokeAsync(operation: "getProperty",
                                  mode: .Normal,
                                  write: { ostr in
                                      ostr.write(iceP_key)
                                  },
                                  read: { istr in
                                      let iceP_returnValue: Swift.String = try istr.read()
                                      return iceP_returnValue
                                  },
                                  context: context,
                                  sentOn: sentOn,
                                  sentFlags: sentFlags,
                                  sent: sent)
    }

    /// Get all properties whose keys begin with prefix. If
    /// prefix is an empty string then all properties are returned.
    ///
    /// - parameter _: `Swift.String` The prefix to search for (empty string if none).
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    ///
    /// - returns: `PropertyDict` - The matching property set.
    func getPropertiesForPrefix(_ iceP_prefix: Swift.String, context: Context? = nil) throws -> PropertyDict {
        return try _impl._invoke(operation: "getPropertiesForPrefix",
                                 mode: .Normal,
                                 write: { ostr in
                                     ostr.write(iceP_prefix)
                                 },
                                 read: { istr in
                                     let iceP_returnValue: PropertyDict = try PropertyDictHelper.read(from: istr)
                                     return iceP_returnValue
                                 },
                                 context: context)
    }

    /// Get all properties whose keys begin with prefix. If
    /// prefix is an empty string then all properties are returned.
    ///
    /// - parameter _: `Swift.String` The prefix to search for (empty string if none).
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
    /// - returns: `PromiseKit.Promise<PropertyDict>` - The result of the operation
    func getPropertiesForPrefixAsync(_ iceP_prefix: Swift.String, context: Context? = nil, sentOn: Dispatch.DispatchQueue? = nil, sentFlags: Dispatch.DispatchWorkItemFlags? = nil, sent: ((Swift.Bool) -> Swift.Void)? = nil) -> PromiseKit.Promise<PropertyDict> {
        return _impl._invokeAsync(operation: "getPropertiesForPrefix",
                                  mode: .Normal,
                                  write: { ostr in
                                      ostr.write(iceP_prefix)
                                  },
                                  read: { istr in
                                      let iceP_returnValue: PropertyDict = try PropertyDictHelper.read(from: istr)
                                      return iceP_returnValue
                                  },
                                  context: context,
                                  sentOn: sentOn,
                                  sentFlags: sentFlags,
                                  sent: sent)
    }

    /// Update the communicator's properties with the given property set.
    ///
    /// - parameter _: `PropertyDict` Properties to be added, changed, or removed.
    /// If an entry in newProperties matches the name of an existing property,
    /// that property's value is replaced with the new value. If the new value
    /// is an empty string, the property is removed. Any existing properties
    /// that are not modified or removed by the entries in newProperties are
    /// retained with their original values.
    ///
    /// - parameter context: `Ice.Context` - Optional request context.
    func setProperties(_ iceP_newProperties: PropertyDict, context: Context? = nil) throws {
        try _impl._invoke(operation: "setProperties",
                          mode: .Normal,
                          write: { ostr in
                              PropertyDictHelper.write(to: ostr, value: iceP_newProperties)
                          },
                          context: context)
    }

    /// Update the communicator's properties with the given property set.
    ///
    /// - parameter _: `PropertyDict` Properties to be added, changed, or removed.
    /// If an entry in newProperties matches the name of an existing property,
    /// that property's value is replaced with the new value. If the new value
    /// is an empty string, the property is removed. Any existing properties
    /// that are not modified or removed by the entries in newProperties are
    /// retained with their original values.
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
    func setPropertiesAsync(_ iceP_newProperties: PropertyDict, context: Context? = nil, sentOn: Dispatch.DispatchQueue? = nil, sentFlags: Dispatch.DispatchWorkItemFlags? = nil, sent: ((Swift.Bool) -> Swift.Void)? = nil) -> PromiseKit.Promise<Swift.Void> {
        return _impl._invokeAsync(operation: "setProperties",
                                  mode: .Normal,
                                  write: { ostr in
                                      PropertyDictHelper.write(to: ostr, value: iceP_newProperties)
                                  },
                                  context: context,
                                  sentOn: sentOn,
                                  sentFlags: sentFlags,
                                  sent: sent)
    }
}


/// Dispatcher for `PropertiesAdmin` servants.
public struct PropertiesAdminDisp: Disp {
    public let servant: PropertiesAdmin
    private static let defaultObject = ObjectI<PropertiesAdminTraits>()

    public init(_ servant: PropertiesAdmin) {
        self.servant = servant
    }

    public func dispatch(request: Request, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        request.startOver()
        switch current.operation {
        case "getPropertiesForPrefix":
            return try servant._iceD_getPropertiesForPrefix(incoming: request, current: current)
        case "getProperty":
            return try servant._iceD_getProperty(incoming: request, current: current)
        case "ice_id":
            return try (servant as? Object ?? PropertiesAdminDisp.defaultObject)._iceD_ice_id(incoming: request, current: current)
        case "ice_ids":
            return try (servant as? Object ?? PropertiesAdminDisp.defaultObject)._iceD_ice_ids(incoming: request, current: current)
        case "ice_isA":
            return try (servant as? Object ?? PropertiesAdminDisp.defaultObject)._iceD_ice_isA(incoming: request, current: current)
        case "ice_ping":
            return try (servant as? Object ?? PropertiesAdminDisp.defaultObject)._iceD_ice_ping(incoming: request, current: current)
        case "setProperties":
            return try servant._iceD_setProperties(incoming: request, current: current)
        default:
            throw OperationNotExistException(id: current.id, facet: current.facet, operation: current.operation)
        }
    }
}

/// The PropertiesAdmin interface provides remote access to the properties
/// of a communicator.
public protocol PropertiesAdmin {
    /// Get a property by key. If the property is not set, an empty
    /// string is returned.
    ///
    /// - parameter key: `Swift.String` The property key.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    ///
    /// - returns: `Swift.String` - The property value.
    func getProperty(key: Swift.String, current: Current) throws -> Swift.String

    /// Get all properties whose keys begin with prefix. If
    /// prefix is an empty string then all properties are returned.
    ///
    /// - parameter prefix: `Swift.String` The prefix to search for (empty string if none).
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    ///
    /// - returns: `PropertyDict` - The matching property set.
    func getPropertiesForPrefix(prefix: Swift.String, current: Current) throws -> PropertyDict

    /// Update the communicator's properties with the given property set.
    ///
    /// - parameter newProperties: `PropertyDict` Properties to be added, changed, or removed.
    /// If an entry in newProperties matches the name of an existing property,
    /// that property's value is replaced with the new value. If the new value
    /// is an empty string, the property is removed. Any existing properties
    /// that are not modified or removed by the entries in newProperties are
    /// retained with their original values.
    ///
    /// - parameter current: `Ice.Current` - The Current object for the dispatch.
    func setProperties(newProperties: PropertyDict, current: Current) throws
}

/// The PropertiesAdmin interface provides remote access to the properties
/// of a communicator.
///
/// PropertiesAdmin Methods:
///
///  - getProperty: Get a property by key.
///
///  - getPropertiesForPrefix: Get all properties whose keys begin with prefix.
///
///  - setProperties: Update the communicator's properties with the given property set.
public extension PropertiesAdmin {
    func _iceD_getProperty(incoming inS: Incoming, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        let iceP_key: Swift.String = try inS.read { istr in
            let iceP_key: Swift.String = try istr.read()
            return iceP_key
        }

        let iceP_returnValue = try self.getProperty(key: iceP_key, current: current)

        return inS.setResult{ ostr in
            ostr.write(iceP_returnValue)
        }
    }

    func _iceD_getPropertiesForPrefix(incoming inS: Incoming, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        let iceP_prefix: Swift.String = try inS.read { istr in
            let iceP_prefix: Swift.String = try istr.read()
            return iceP_prefix
        }

        let iceP_returnValue = try self.getPropertiesForPrefix(prefix: iceP_prefix, current: current)

        return inS.setResult{ ostr in
            PropertyDictHelper.write(to: ostr, value: iceP_returnValue)
        }
    }

    func _iceD_setProperties(incoming inS: Incoming, current: Current) throws -> PromiseKit.Promise<OutputStream>? {
        let iceP_newProperties: PropertyDict = try inS.read { istr in
            let iceP_newProperties: PropertyDict = try PropertyDictHelper.read(from: istr)
            return iceP_newProperties
        }

        try self.setProperties(newProperties: iceP_newProperties, current: current)

        return inS.setResult()
    }
}
