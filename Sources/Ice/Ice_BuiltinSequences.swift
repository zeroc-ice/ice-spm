//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.6
//
// <auto-generated>
//
// Generated from file `BuiltinSequences.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation

/// A sequence of bools.
public typealias BoolSeq = [Swift.Bool]

/// A sequence of bytes.
public typealias ByteSeq = Foundation.Data

/// A sequence of shorts.
public typealias ShortSeq = [Swift.Int16]

/// A sequence of ints.
public typealias IntSeq = [Swift.Int32]

/// A sequence of longs.
public typealias LongSeq = [Swift.Int64]

/// A sequence of floats.
public typealias FloatSeq = [Swift.Float]

/// A sequence of doubles.
public typealias DoubleSeq = [Swift.Double]

/// A sequence of strings.
public typealias StringSeq = [Swift.String]

/// A sequence of objects.
public typealias ObjectSeq = [Value?]

/// Helper class to read and write `ObjectSeq` sequence values from
/// `Ice.InputStream` and `Ice.OutputStream`.
public struct ObjectSeqHelper {
    /// Read a `ObjectSeq` sequence from the stream.
    ///
    /// - parameter istr: `Ice.InputStream` - The stream to read from.
    ///
    /// - returns: `ObjectSeq` - The sequence read from the stream.
    public static func read(from istr: InputStream) throws -> ObjectSeq {
        let sz = try istr.readAndCheckSeqSize(minSize: 1)
        var v = ObjectSeq(repeating: nil, count: sz)
        for i in 0 ..< sz {
            try Swift.withUnsafeMutablePointer(to: &v[i]) { p in
                try istr.read() { p.pointee = $0 }
            }
        }
        return v
    }
    /// Read an optional `ObjectSeq?` sequence from the stream.
    ///
    /// - parameter istr: `Ice.InputStream` - The stream to read from.
    ///
    /// - parameter tag: `Swift.Int32` - The numeric tag associated with the value.
    ///
    /// - returns: `ObjectSeq` - The sequence read from the stream.
    public static func read(from istr: InputStream, tag: Swift.Int32) throws -> ObjectSeq? {
        guard try istr.readOptional(tag: tag, expectedFormat: .FSize) else {
            return nil
        }
        try istr.skip(4)
        return try read(from: istr)
    }

    /// Wite a `ObjectSeq` sequence to the stream.
    ///
    /// - parameter ostr: `Ice.OuputStream` - The stream to write to.
    ///
    /// - parameter value: `ObjectSeq` - The sequence value to write to the stream.
    public static func write(to ostr: OutputStream, value v: ObjectSeq) {
        ostr.write(size: v.count)
        for item in v {
            ostr.write(item)
        }
    }

    /// Wite an optional `ObjectSeq?` sequence to the stream.
    ///
    /// - parameter ostr: `Ice.OuputStream` - The stream to write to.
    ///
    /// - parameter tag: `Int32` - The numeric tag associated with the value.
    ///
    /// - parameter value: `ObjectSeq` The sequence value to write to the stream.
    public static func write(to ostr: OutputStream,  tag: Swift.Int32, value v: ObjectSeq?) {
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

/// A sequence of object proxies.
public typealias ObjectProxySeq = [ObjectPrx?]

/// Helper class to read and write `ObjectProxySeq` sequence values from
/// `Ice.InputStream` and `Ice.OutputStream`.
public struct ObjectProxySeqHelper {
    /// Read a `ObjectProxySeq` sequence from the stream.
    ///
    /// - parameter istr: `Ice.InputStream` - The stream to read from.
    ///
    /// - returns: `ObjectProxySeq` - The sequence read from the stream.
    public static func read(from istr: InputStream) throws -> ObjectProxySeq {
        let sz = try istr.readAndCheckSeqSize(minSize: 2)
        var v = ObjectProxySeq()
        v.reserveCapacity(sz)
        for _ in 0 ..< sz {
            let j: ObjectPrx? = try istr.read(ObjectPrx.self)
            v.append(j)
        }
        return v
    }
    /// Read an optional `ObjectProxySeq?` sequence from the stream.
    ///
    /// - parameter istr: `Ice.InputStream` - The stream to read from.
    ///
    /// - parameter tag: `Swift.Int32` - The numeric tag associated with the value.
    ///
    /// - returns: `ObjectProxySeq` - The sequence read from the stream.
    public static func read(from istr: InputStream, tag: Swift.Int32) throws -> ObjectProxySeq? {
        guard try istr.readOptional(tag: tag, expectedFormat: .FSize) else {
            return nil
        }
        try istr.skip(4)
        return try read(from: istr)
    }

    /// Wite a `ObjectProxySeq` sequence to the stream.
    ///
    /// - parameter ostr: `Ice.OuputStream` - The stream to write to.
    ///
    /// - parameter value: `ObjectProxySeq` - The sequence value to write to the stream.
    public static func write(to ostr: OutputStream, value v: ObjectProxySeq) {
        ostr.write(size: v.count)
        for item in v {
            ostr.write(item)
        }
    }

    /// Wite an optional `ObjectProxySeq?` sequence to the stream.
    ///
    /// - parameter ostr: `Ice.OuputStream` - The stream to write to.
    ///
    /// - parameter tag: `Int32` - The numeric tag associated with the value.
    ///
    /// - parameter value: `ObjectProxySeq` The sequence value to write to the stream.
    public static func write(to ostr: OutputStream,  tag: Swift.Int32, value v: ObjectProxySeq?) {
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
