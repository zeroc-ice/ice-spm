//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.7
//
// <auto-generated>
//
// Generated from file `Instrumentation.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

#ifndef ICE_API_EXPORTS
#   define ICE_API_EXPORTS
#endif
#include <Ice/Instrumentation.h>
#include <IceUtil/PushDisableWarnings.h>
#include <Ice/InputStream.h>
#include <Ice/OutputStream.h>
#include <IceUtil/PopDisableWarnings.h>

#if defined(_MSC_VER)
#   pragma warning(disable:4458) // declaration of ... hides class member
#elif defined(__clang__)
#   pragma clang diagnostic ignored "-Wshadow"
#elif defined(__GNUC__)
#   pragma GCC diagnostic ignored "-Wshadow"
#endif

#ifndef ICE_IGNORE_VERSION
#   if ICE_INT_VERSION / 100 != 307
#       error Ice version mismatch!
#   endif
#   if ICE_INT_VERSION % 100 >= 50
#       error Beta header file detected
#   endif
#   if ICE_INT_VERSION % 100 < 7
#       error Ice patch level mismatch!
#   endif
#endif

#ifdef ICE_CPP11_MAPPING // C++11 mapping

namespace
{

}

Ice::Instrumentation::Observer::~Observer()
{
}

Ice::Instrumentation::ThreadObserver::~ThreadObserver()
{
}

Ice::Instrumentation::ConnectionObserver::~ConnectionObserver()
{
}

Ice::Instrumentation::DispatchObserver::~DispatchObserver()
{
}

Ice::Instrumentation::ChildInvocationObserver::~ChildInvocationObserver()
{
}

Ice::Instrumentation::RemoteObserver::~RemoteObserver()
{
}

Ice::Instrumentation::CollocatedObserver::~CollocatedObserver()
{
}

Ice::Instrumentation::InvocationObserver::~InvocationObserver()
{
}

Ice::Instrumentation::ObserverUpdater::~ObserverUpdater()
{
}

Ice::Instrumentation::CommunicatorObserver::~CommunicatorObserver()
{
}

#else // C++98 mapping

namespace
{

namespace
{

}

}

Ice::Instrumentation::Observer::~Observer()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(Observer* p) { return p; }
/// \endcond

Ice::Instrumentation::ThreadObserver::~ThreadObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(ThreadObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::ConnectionObserver::~ConnectionObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(ConnectionObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::DispatchObserver::~DispatchObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(DispatchObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::ChildInvocationObserver::~ChildInvocationObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(ChildInvocationObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::RemoteObserver::~RemoteObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(RemoteObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::CollocatedObserver::~CollocatedObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(CollocatedObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::InvocationObserver::~InvocationObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(InvocationObserver* p) { return p; }
/// \endcond

Ice::Instrumentation::ObserverUpdater::~ObserverUpdater()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(ObserverUpdater* p) { return p; }
/// \endcond

Ice::Instrumentation::CommunicatorObserver::~CommunicatorObserver()
{
}

/// \cond INTERNAL
ICE_API ::Ice::LocalObject* Ice::Instrumentation::upCast(CommunicatorObserver* p) { return p; }
/// \endcond

namespace Ice
{
}

#endif
