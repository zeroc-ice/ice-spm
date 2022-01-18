//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.7
//
// <auto-generated>
//
// Generated from file `Properties.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation

/// A property set used to configure Ice and Ice applications.
/// Properties are key/value pairs, with both keys and values
/// being strings. By convention, property keys should have the form
/// application-name\[.category\[.sub-category]].name.
public protocol Properties:  Swift.AnyObject {
    /// Get a property by key. If the property is not set, an empty
    /// string is returned.
    ///
    /// - parameter _: `Swift.String` The property key.
    ///
    /// - returns: `Swift.String` - The property value.
    func getProperty(_ key: Swift.String) -> Swift.String

    /// Get a property by key. If the property is not set, the
    /// given default value is returned.
    ///
    /// - parameter key: `Swift.String` The property key.
    ///
    /// - parameter value: `Swift.String` The default value to use if the property does not
    /// exist.
    ///
    /// - returns: `Swift.String` - The property value or the default value.
    func getPropertyWithDefault(key: Swift.String, value: Swift.String) -> Swift.String

    /// Get a property as an integer. If the property is not set, 0
    /// is returned.
    ///
    /// - parameter _: `Swift.String` The property key.
    ///
    /// - returns: `Swift.Int32` - The property value interpreted as an integer.
    func getPropertyAsInt(_ key: Swift.String) -> Swift.Int32

    /// Get a property as an integer. If the property is not set, the
    /// given default value is returned.
    ///
    /// - parameter key: `Swift.String` The property key.
    ///
    /// - parameter value: `Swift.Int32` The default value to use if the property does not
    /// exist.
    ///
    /// - returns: `Swift.Int32` - The property value interpreted as an integer, or the
    /// default value.
    func getPropertyAsIntWithDefault(key: Swift.String, value: Swift.Int32) -> Swift.Int32

    /// Get a property as a list of strings. The strings must be
    /// separated by whitespace or comma. If the property is not set,
    /// an empty list is returned. The strings in the list can contain
    /// whitespace and commas if they are enclosed in single or double
    /// quotes. If quotes are mismatched, an empty list is returned.
    /// Within single quotes or double quotes, you can escape the
    /// quote in question with \, e.g. O'Reilly can be written as
    /// O'Reilly, "O'Reilly" or 'O\'Reilly'.
    ///
    /// - parameter _: `Swift.String` The property key.
    ///
    /// - returns: `StringSeq` - The property value interpreted as a list of strings.
    func getPropertyAsList(_ key: Swift.String) -> StringSeq

    /// Get a property as a list of strings.  The strings must be
    /// separated by whitespace or comma. If the property is not set,
    /// the default list is returned. The strings in the list can contain
    /// whitespace and commas if they are enclosed in single or double
    /// quotes. If quotes are mismatched, the default list is returned.
    /// Within single quotes or double quotes, you can escape the
    /// quote in question with \, e.g. O'Reilly can be written as
    /// O'Reilly, "O'Reilly" or 'O\'Reilly'.
    ///
    /// - parameter key: `Swift.String` The property key.
    ///
    /// - parameter value: `StringSeq` The default value to use if the property is not set.
    ///
    /// - returns: `StringSeq` - The property value interpreted as list of strings, or the
    /// default value.
    func getPropertyAsListWithDefault(key: Swift.String, value: StringSeq) -> StringSeq

    /// Get all properties whose keys begins with
    /// prefix. If
    /// prefix is an empty string,
    /// then all properties are returned.
    ///
    /// - parameter _: `Swift.String` The prefix to search for (empty string if none).
    ///
    /// - returns: `PropertyDict` - The matching property set.
    func getPropertiesForPrefix(_ prefix: Swift.String) -> PropertyDict

    /// Set a property. To unset a property, set it to
    /// the empty string.
    ///
    /// - parameter key: `Swift.String` The property key.
    ///
    /// - parameter value: `Swift.String` The property value.
    func setProperty(key: Swift.String, value: Swift.String)

    /// Get a sequence of command-line options that is equivalent to
    /// this property set. Each element of the returned sequence is
    /// a command-line option of the form
    /// --key=value.
    ///
    /// - returns: `StringSeq` - The command line options for this property set.
    func getCommandLineOptions() -> StringSeq

    /// Convert a sequence of command-line options into properties.
    /// All options that begin with
    /// --prefix. are
    /// converted into properties. If the prefix is empty, all options
    /// that begin with -- are converted to properties.
    ///
    /// - parameter prefix: `Swift.String` The property prefix, or an empty string to
    /// convert all options starting with --.
    ///
    /// - parameter options: `StringSeq` The command-line options.
    ///
    /// - returns: `StringSeq` - The command-line options that do not start with the specified
    /// prefix, in their original order.
    func parseCommandLineOptions(prefix: Swift.String, options: StringSeq) throws -> StringSeq

    /// Convert a sequence of command-line options into properties.
    /// All options that begin with one of the following prefixes
    /// are converted into properties: --Ice, --IceBox, --IceGrid,
    /// --IcePatch2, --IceSSL, --IceStorm, --Freeze, and --Glacier2.
    ///
    /// - parameter _: `StringSeq` The command-line options.
    ///
    /// - returns: `StringSeq` - The command-line options that do not start with one of
    /// the listed prefixes, in their original order.
    func parseIceCommandLineOptions(_ options: StringSeq) throws -> StringSeq

    /// Load properties from a file.
    ///
    /// - parameter _: `Swift.String` The property file.
    func load(_ file: Swift.String) throws

    /// Create a copy of this property set.
    ///
    /// - returns: `Properties` - A copy of this property set.
    func clone() -> Properties
}
