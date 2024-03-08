//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

import Dispatch
import IceImpl

/// Converts a string to an encoding version.
///
/// - parameter _: `String` - The string to convert.
///
/// - returns: `Ice.EncodingVersion` - The converted encoding version.</returns>
func stringToEncodingVersion(_ s: String) throws -> EncodingVersion {
    let (major, minor) = try stringToMajorMinor(s)
    return EncodingVersion(major: major, minor: minor)
}

func stringToMajorMinor(_ s: String) throws -> (UInt8, UInt8) {
    let components = s.components(separatedBy: ".")
    guard components.count == 2 else {
        throw VersionParseException(str: "malformed value `\(s)'")
    }

    guard let major = UInt8(components[0] as String), let minor = UInt8(components[1]) else {
        throw VersionParseException(str: "invalid version value `\(s)'")
    }

    return (major, minor)
}

func createSentCallback(sentOn: DispatchQueue?,
                        sentFlags: DispatchWorkItemFlags?,
                        sent: ((Bool) -> Void)?) -> ((Bool) -> Void)? {
    guard let s = sent else {
        // If sent is nil, we keep it as-is
        return sent
    }

    guard let q = sentOn else {
        // If sentOn is nil, we just wrap sent in an autorelease pool
        return { sentSynchronously in
            autoreleasepool {
                s(sentSynchronously)
            }
        }
    }

    //
    // Create a closure to dispatch the sent callback in the specified queue
    //
    if let flags = sentFlags {
        return { sentSynchronously in
            q.async(flags: flags) {
                s(sentSynchronously)
            }
        }
    } else {
        return { sentSynchronously in
            q.async {
                s(sentSynchronously)
            }
        }
    }
}

func escapeString(string: String, special: String, communicator: Communicator) throws -> String {
    guard factoriesRegistered else {
        fatalError("Unable to initialie Ice")
    }
    return try autoreleasepool {
        try ICEUtil.escapeString(string: string,
                                 special: special,
                                 communicator: (communicator as! CommunicatorI).handle)
    }
}

func checkSupportedEncoding(_ v: EncodingVersion) throws {
    let c = currentEncoding
    if v.major != c.major || v.minor > c.minor {
        throw UnsupportedEncodingException(reason: "", bad: v, supported: c)
    }
}
