//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.6
//
// <auto-generated>
//
// Generated from file `EndpointInfo.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation

/// Provides access to an IAP endpoint information.
public protocol IAPEndpointInfo: EndpointInfo {
    /// The accessory manufacturer or empty to not match against
    /// a manufacturer.
    var manufacturer: Swift.String { get set }
    /// The accessory model number or empty to not match against
    /// a model number.
    var modelNumber: Swift.String { get set }
    /// The accessory name or empty to not match against
    /// the accessory name.
    var name: Swift.String { get set }
    /// The protocol supported by the accessory.
    var `protocol`: Swift.String { get set }
}
