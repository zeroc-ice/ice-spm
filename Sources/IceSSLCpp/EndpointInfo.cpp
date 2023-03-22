//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.9
//
// <auto-generated>
//
// Generated from file `EndpointInfo.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

#ifndef ICESSL_API_EXPORTS
#   define ICESSL_API_EXPORTS
#endif
#include <IceSSL/EndpointInfo.h>
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
#   if ICE_INT_VERSION % 100 < 9
#       error Ice patch level mismatch!
#   endif
#endif

#ifdef ICE_CPP11_MAPPING // C++11 mapping

namespace
{

}

IceSSL::EndpointInfo::~EndpointInfo()
{
}

#else // C++98 mapping

namespace
{

}

IceSSL::EndpointInfo::~EndpointInfo()
{
}

/// \cond INTERNAL
ICESSL_API ::Ice::LocalObject* IceSSL::upCast(EndpointInfo* p) { return p; }
/// \endcond

namespace Ice
{
}

#endif
