//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.8
//
// <auto-generated>
//
// Generated from file `ServantLocator.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

#ifndef __Ice_ServantLocator_h__
#define __Ice_ServantLocator_h__

#include <IceUtil/PushDisableWarnings.h>
#include <Ice/ProxyF.h>
#include <Ice/ObjectF.h>
#include <Ice/ValueF.h>
#include <Ice/Exception.h>
#include <Ice/LocalObject.h>
#include <Ice/StreamHelpers.h>
#include <Ice/Comparable.h>
#include <IceUtil/ScopedArray.h>
#include <Ice/Optional.h>
#include <Ice/ObjectAdapterF.h>
#include <Ice/Current.h>
#include <IceUtil/UndefSysMacros.h>

#ifndef ICE_IGNORE_VERSION
#   if ICE_INT_VERSION / 100 != 307
#       error Ice version mismatch!
#   endif
#   if ICE_INT_VERSION % 100 >= 50
#       error Beta header file detected
#   endif
#   if ICE_INT_VERSION % 100 < 8
#       error Ice patch level mismatch!
#   endif
#endif

#ifndef ICE_API
#   if defined(ICE_STATIC_LIBS)
#       define ICE_API /**/
#   elif defined(ICE_API_EXPORTS)
#       define ICE_API ICE_DECLSPEC_EXPORT
#   else
#       define ICE_API ICE_DECLSPEC_IMPORT
#   endif
#endif

#ifdef ICE_CPP11_MAPPING // C++11 mapping

namespace Ice
{

class ServantLocator;

}

namespace Ice
{

/**
 * A servant locator is called by an object adapter to
 * locate a servant that is not found in its active servant map.
 * @see ObjectAdapter
 * @see ObjectAdapter#addServantLocator
 * @see ObjectAdapter#findServantLocator
 * \headerfile Ice/Ice.h
 */
class ICE_CLASS(ICE_API) ServantLocator
{
public:

    ICE_MEMBER(ICE_API) virtual ~ServantLocator();

    /**
     * Called before a request is dispatched if a
     * servant cannot be found in the object adapter's active servant
     * map. Note that the object adapter does not automatically insert
     * the returned servant into its active servant map. This must be
     * done by the servant locator implementation, if this is desired.
     *
     * <code>locate</code> can throw any user exception. If it does, that exception
     * is marshaled back to the client. If the Slice definition for the
     * corresponding operation includes that user exception, the client
     * receives that user exception; otherwise, the client receives
     * {@link UnknownUserException}.
     *
     * If <code>locate</code> throws any exception, the Ice run time does <em>not</em>
     * call <code>finished</code>.
     *
     * <p class="Note">If you call <code>locate</code> from your own code, you
     * must also call <code>finished</code> when you have finished using the
     * servant, provided that <code>locate</code> returned a non-null servant;
     * otherwise, you will get undefined behavior if you use
     * servant locators such as the Freeze Evictor.
     * @param curr Information about the current operation for which
     * a servant is required.
     * @param cookie A "cookie" that will be passed to <code>finished</code>.
     * @return The located servant, or null if no suitable servant has
     * been found.
     * @throws UserException The implementation can raise a UserException
     * and the run time will marshal it as the result of the invocation.
     * @see ObjectAdapter
     * @see Current
     * @see #finished
     */
    virtual ::std::shared_ptr<::Ice::Object> locate(const Current& curr, ::std::shared_ptr<void>& cookie) = 0;

    /**
     * Called by the object adapter after a request has been
     * made. This operation is only called if <code>locate</code> was called
     * prior to the request and returned a non-null servant. This
     * operation can be used for cleanup purposes after a request.
     *
     * <code>finished</code> can throw any user exception. If it does, that exception
     * is marshaled back to the client. If the Slice definition for the
     * corresponding operation includes that user exception, the client
     * receives that user exception; otherwise, the client receives
     * {@link UnknownUserException}.
     *
     * If both the operation and <code>finished</code> throw an exception, the
     * exception thrown by <code>finished</code> is marshaled back to the client.
     * @param curr Information about the current operation call for
     * which a servant was located by <code>locate</code>.
     * @param servant The servant that was returned by <code>locate</code>.
     * @param cookie The cookie that was returned by <code>locate</code>.
     * @throws UserException The implementation can raise a UserException
     * and the run time will marshal it as the result of the invocation.
     * @see ObjectAdapter
     * @see Current
     * @see #locate
     */
    virtual void finished(const Current& curr, const ::std::shared_ptr<Object>& servant, const ::std::shared_ptr<void>& cookie) = 0;

    /**
     * Called when the object adapter in which this servant locator is
     * installed is destroyed.
     * @param category Indicates for which category the servant locator
     * is being deactivated.
     * @see ObjectAdapter#destroy
     * @see Communicator#shutdown
     * @see Communicator#destroy
     */
    virtual void deactivate(const ::std::string& category) = 0;
};

}

/// \cond STREAM
namespace Ice
{

}
/// \endcond

/// \cond INTERNAL
namespace Ice
{

using ServantLocatorPtr = ::std::shared_ptr<ServantLocator>;

}
/// \endcond

#else // C++98 mapping

namespace Ice
{

class ServantLocator;
/// \cond INTERNAL
ICE_API LocalObject* upCast(ServantLocator*);
/// \endcond
typedef ::IceInternal::Handle< ServantLocator> ServantLocatorPtr;

}

namespace Ice
{

/**
 * A servant locator is called by an object adapter to
 * locate a servant that is not found in its active servant map.
 * @see ObjectAdapter
 * @see ObjectAdapter#addServantLocator
 * @see ObjectAdapter#findServantLocator
 * \headerfile Ice/Ice.h
 */
class ICE_API ServantLocator : public virtual LocalObject
{
public:

    typedef ServantLocatorPtr PointerType;

    virtual ~ServantLocator();

#ifdef ICE_CPP11_COMPILER
    ServantLocator() = default;
    ServantLocator(const ServantLocator&) = default;
    ServantLocator& operator=(const ServantLocator&) = default;
#endif

    /**
     * Called before a request is dispatched if a
     * servant cannot be found in the object adapter's active servant
     * map. Note that the object adapter does not automatically insert
     * the returned servant into its active servant map. This must be
     * done by the servant locator implementation, if this is desired.
     *
     * <code>locate</code> can throw any user exception. If it does, that exception
     * is marshaled back to the client. If the Slice definition for the
     * corresponding operation includes that user exception, the client
     * receives that user exception; otherwise, the client receives
     * {@link UnknownUserException}.
     *
     * If <code>locate</code> throws any exception, the Ice run time does <em>not</em>
     * call <code>finished</code>.
     *
     * <p class="Note">If you call <code>locate</code> from your own code, you
     * must also call <code>finished</code> when you have finished using the
     * servant, provided that <code>locate</code> returned a non-null servant;
     * otherwise, you will get undefined behavior if you use
     * servant locators such as the Freeze Evictor.
     * @param curr Information about the current operation for which
     * a servant is required.
     * @param cookie A "cookie" that will be passed to <code>finished</code>.
     * @return The located servant, or null if no suitable servant has
     * been found.
     * @throws UserException The implementation can raise a UserException
     * and the run time will marshal it as the result of the invocation.
     * @see ObjectAdapter
     * @see Current
     * @see #finished
     */
    virtual ObjectPtr locate(const Current& curr, LocalObjectPtr& cookie) = 0;

    /**
     * Called by the object adapter after a request has been
     * made. This operation is only called if <code>locate</code> was called
     * prior to the request and returned a non-null servant. This
     * operation can be used for cleanup purposes after a request.
     *
     * <code>finished</code> can throw any user exception. If it does, that exception
     * is marshaled back to the client. If the Slice definition for the
     * corresponding operation includes that user exception, the client
     * receives that user exception; otherwise, the client receives
     * {@link UnknownUserException}.
     *
     * If both the operation and <code>finished</code> throw an exception, the
     * exception thrown by <code>finished</code> is marshaled back to the client.
     * @param curr Information about the current operation call for
     * which a servant was located by <code>locate</code>.
     * @param servant The servant that was returned by <code>locate</code>.
     * @param cookie The cookie that was returned by <code>locate</code>.
     * @throws UserException The implementation can raise a UserException
     * and the run time will marshal it as the result of the invocation.
     * @see ObjectAdapter
     * @see Current
     * @see #locate
     */
    virtual void finished(const Current& curr, const ObjectPtr& servant, const LocalObjectPtr& cookie) = 0;

    /**
     * Called when the object adapter in which this servant locator is
     * installed is destroyed.
     * @param category Indicates for which category the servant locator
     * is being deactivated.
     * @see ObjectAdapter#destroy
     * @see Communicator#shutdown
     * @see Communicator#destroy
     */
    virtual void deactivate(const ::std::string& category) = 0;
};

/// \cond INTERNAL
inline bool operator==(const ServantLocator& lhs, const ServantLocator& rhs)
{
    return static_cast<const LocalObject&>(lhs) == static_cast<const LocalObject&>(rhs);
}

inline bool operator<(const ServantLocator& lhs, const ServantLocator& rhs)
{
    return static_cast<const LocalObject&>(lhs) < static_cast<const LocalObject&>(rhs);
}
/// \endcond

}

/// \cond STREAM
namespace Ice
{

}
/// \endcond

#endif

#include <IceUtil/PopDisableWarnings.h>
#endif
