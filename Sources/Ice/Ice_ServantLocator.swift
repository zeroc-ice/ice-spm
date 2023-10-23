//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.10
//
// <auto-generated>
//
// Generated from file `ServantLocator.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

import Foundation

/// A servant locator is called by an object adapter to
/// locate a servant that is not found in its active servant map.
public protocol ServantLocator:  Swift.AnyObject {
    /// Called before a request is dispatched if a
    /// servant cannot be found in the object adapter's active servant
    /// map. Note that the object adapter does not automatically insert
    /// the returned servant into its active servant map. This must be
    /// done by the servant locator implementation, if this is desired.
    ///
    /// locate can throw any user exception. If it does, that exception
    /// is marshaled back to the client. If the Slice definition for the
    /// corresponding operation includes that user exception, the client
    /// receives that user exception; otherwise, the client receives
    /// UnknownUserException.
    ///
    /// If locate throws any exception, the Ice run time does not
    /// call finished.
    ///
    /// If you call locate from your own code, you
    /// must also call finished when you have finished using the
    /// servant, provided that locate returned a non-null servant;
    /// otherwise, you will get undefined behavior if you use
    /// servant locators such as the Freeze Evictor.
    ///
    /// - parameter _: `Current` Information about the current operation for which
    /// a servant is required.
    ///
    /// - returns: `(returnValue: Disp?, cookie: Swift.AnyObject?)`:
    ///
    ///   - returnValue: `Disp?` - The located servant, or null if no suitable servant has
    /// been found.
    ///
    ///   - cookie: `Swift.AnyObject?` - A "cookie" that will be passed to finished.
    ///
    /// - throws:
    ///
    ///   - UserException - The implementation can raise a UserException
    ///     and the run time will marshal it as the result of the invocation.
    func locate(_ curr: Current) throws -> (returnValue: Disp?, cookie: Swift.AnyObject?)

    /// Called by the object adapter after a request has been
    /// made. This operation is only called if locate was called
    /// prior to the request and returned a non-null servant. This
    /// operation can be used for cleanup purposes after a request.
    ///
    /// finished can throw any user exception. If it does, that exception
    /// is marshaled back to the client. If the Slice definition for the
    /// corresponding operation includes that user exception, the client
    /// receives that user exception; otherwise, the client receives
    /// UnknownUserException.
    ///
    /// If both the operation and finished throw an exception, the
    /// exception thrown by finished is marshaled back to the client.
    ///
    /// - parameter curr: `Current` Information about the current operation call for
    /// which a servant was located by locate.
    ///
    /// - parameter servant: `Disp` The servant that was returned by locate.
    ///
    /// - parameter cookie: `Swift.AnyObject?` The cookie that was returned by locate.
    ///
    /// - throws:
    ///
    ///   - UserException - The implementation can raise a UserException
    ///     and the run time will marshal it as the result of the invocation.
    func finished(curr: Current, servant: Disp, cookie: Swift.AnyObject?) throws

    /// Called when the object adapter in which this servant locator is
    /// installed is destroyed.
    ///
    /// - parameter _: `Swift.String` Indicates for which category the servant locator
    /// is being deactivated.
    func deactivate(_ category: Swift.String)
}
