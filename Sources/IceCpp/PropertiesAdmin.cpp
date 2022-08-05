//
// Copyright (c) ZeroC, Inc. All rights reserved.
//
//
// Ice version 3.7.8
//
// <auto-generated>
//
// Generated from file `PropertiesAdmin.ice'
//
// Warning: do not edit this file.
//
// </auto-generated>
//

#ifndef ICE_API_EXPORTS
#   define ICE_API_EXPORTS
#endif
#include <Ice/PropertiesAdmin.h>
#include <IceUtil/PushDisableWarnings.h>
#include <Ice/LocalException.h>
#include <Ice/ValueFactory.h>
#include <Ice/OutgoingAsync.h>
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
#   if ICE_INT_VERSION % 100 < 8
#       error Ice patch level mismatch!
#   endif
#endif

#ifdef ICE_CPP11_MAPPING // C++11 mapping

namespace
{

const ::std::string iceC_Ice_PropertiesAdmin_ids[2] =
{
    "::Ice::Object",
    "::Ice::PropertiesAdmin"
};
const ::std::string iceC_Ice_PropertiesAdmin_ops[] =
{
    "getPropertiesForPrefix",
    "getProperty",
    "ice_id",
    "ice_ids",
    "ice_isA",
    "ice_ping",
    "setProperties"
};
const ::std::string iceC_Ice_PropertiesAdmin_getProperty_name = "getProperty";
const ::std::string iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name = "getPropertiesForPrefix";
const ::std::string iceC_Ice_PropertiesAdmin_setProperties_name = "setProperties";

}

bool
Ice::PropertiesAdmin::ice_isA(::std::string s, const Current&) const
{
    return ::std::binary_search(iceC_Ice_PropertiesAdmin_ids, iceC_Ice_PropertiesAdmin_ids + 2, s);
}

::std::vector<::std::string>
Ice::PropertiesAdmin::ice_ids(const Current&) const
{
    return ::std::vector<::std::string>(&iceC_Ice_PropertiesAdmin_ids[0], &iceC_Ice_PropertiesAdmin_ids[2]);
}

::std::string
Ice::PropertiesAdmin::ice_id(const Current&) const
{
    return ice_staticId();
}

const ::std::string&
Ice::PropertiesAdmin::ice_staticId()
{
    static const ::std::string typeId = "::Ice::PropertiesAdmin";
    return typeId;
}

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceD_getProperty(::IceInternal::Incoming& inS, const Current& current)
{
    _iceCheckMode(::Ice::OperationMode::Normal, current.mode);
    auto istr = inS.startReadParams();
    ::std::string iceP_key;
    istr->readAll(iceP_key);
    inS.endReadParams();
    ::std::string ret = this->getProperty(::std::move(iceP_key), current);
    auto ostr = inS.startWriteParams();
    ostr->writeAll(ret);
    inS.endWriteParams();
    return true;
}
/// \endcond

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceD_getPropertiesForPrefix(::IceInternal::Incoming& inS, const Current& current)
{
    _iceCheckMode(::Ice::OperationMode::Normal, current.mode);
    auto istr = inS.startReadParams();
    ::std::string iceP_prefix;
    istr->readAll(iceP_prefix);
    inS.endReadParams();
    PropertyDict ret = this->getPropertiesForPrefix(::std::move(iceP_prefix), current);
    auto ostr = inS.startWriteParams();
    ostr->writeAll(ret);
    inS.endWriteParams();
    return true;
}
/// \endcond

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceD_setProperties(::IceInternal::Incoming& inS, const Current& current)
{
    _iceCheckMode(::Ice::OperationMode::Normal, current.mode);
    auto istr = inS.startReadParams();
    PropertyDict iceP_newProperties;
    istr->readAll(iceP_newProperties);
    inS.endReadParams();
    this->setProperties(::std::move(iceP_newProperties), current);
    inS.writeEmptyParams();
    return true;
}
/// \endcond

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceDispatch(::IceInternal::Incoming& in, const Current& current)
{
    ::std::pair<const ::std::string*, const ::std::string*> r = ::std::equal_range(iceC_Ice_PropertiesAdmin_ops, iceC_Ice_PropertiesAdmin_ops + 7, current.operation);
    if(r.first == r.second)
    {
        throw OperationNotExistException(__FILE__, __LINE__, current.id, current.facet, current.operation);
    }

    switch(r.first - iceC_Ice_PropertiesAdmin_ops)
    {
        case 0:
        {
            return _iceD_getPropertiesForPrefix(in, current);
        }
        case 1:
        {
            return _iceD_getProperty(in, current);
        }
        case 2:
        {
            return _iceD_ice_id(in, current);
        }
        case 3:
        {
            return _iceD_ice_ids(in, current);
        }
        case 4:
        {
            return _iceD_ice_isA(in, current);
        }
        case 5:
        {
            return _iceD_ice_ping(in, current);
        }
        case 6:
        {
            return _iceD_setProperties(in, current);
        }
        default:
        {
            assert(false);
            throw OperationNotExistException(__FILE__, __LINE__, current.id, current.facet, current.operation);
        }
    }
}
/// \endcond

/// \cond INTERNAL
void
Ice::PropertiesAdminPrx::_iceI_getProperty(const ::std::shared_ptr<::IceInternal::OutgoingAsyncT<::std::string>>& outAsync, const ::std::string& iceP_key, const Context& context)
{
    _checkTwowayOnly(iceC_Ice_PropertiesAdmin_getProperty_name);
    outAsync->invoke(iceC_Ice_PropertiesAdmin_getProperty_name, ::Ice::OperationMode::Normal, ::Ice::FormatType::DefaultFormat, context,
        [&](OutputStream* ostr)
        {
            ostr->writeAll(iceP_key);
        },
        nullptr);
}
/// \endcond

/// \cond INTERNAL
void
Ice::PropertiesAdminPrx::_iceI_getPropertiesForPrefix(const ::std::shared_ptr<::IceInternal::OutgoingAsyncT<::Ice::PropertyDict>>& outAsync, const ::std::string& iceP_prefix, const Context& context)
{
    _checkTwowayOnly(iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name);
    outAsync->invoke(iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name, ::Ice::OperationMode::Normal, ::Ice::FormatType::DefaultFormat, context,
        [&](OutputStream* ostr)
        {
            ostr->writeAll(iceP_prefix);
        },
        nullptr);
}
/// \endcond

/// \cond INTERNAL
void
Ice::PropertiesAdminPrx::_iceI_setProperties(const ::std::shared_ptr<::IceInternal::OutgoingAsyncT<void>>& outAsync, const PropertyDict& iceP_newProperties, const Context& context)
{
    outAsync->invoke(iceC_Ice_PropertiesAdmin_setProperties_name, ::Ice::OperationMode::Normal, ::Ice::FormatType::DefaultFormat, context,
        [&](OutputStream* ostr)
        {
            ostr->writeAll(iceP_newProperties);
        },
        nullptr);
}
/// \endcond

/// \cond INTERNAL
::std::shared_ptr<::Ice::ObjectPrx>
Ice::PropertiesAdminPrx::_newInstance() const
{
    return ::IceInternal::createProxy<PropertiesAdminPrx>();
}
/// \endcond

const ::std::string&
Ice::PropertiesAdminPrx::ice_staticId()
{
    return PropertiesAdmin::ice_staticId();
}

#else // C++98 mapping

namespace
{

const ::std::string iceC_Ice_PropertiesAdmin_getProperty_name = "getProperty";

const ::std::string iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name = "getPropertiesForPrefix";

const ::std::string iceC_Ice_PropertiesAdmin_setProperties_name = "setProperties";

}

/// \cond INTERNAL
ICE_API ::IceProxy::Ice::Object* ::IceProxy::Ice::upCast(PropertiesAdmin* p) { return p; }

void
::IceProxy::Ice::_readProxy(::Ice::InputStream* istr, ::IceInternal::ProxyHandle< PropertiesAdmin>& v)
{
    ::Ice::ObjectPrx proxy;
    istr->read(proxy);
    if(!proxy)
    {
        v = 0;
    }
    else
    {
        v = new PropertiesAdmin;
        v->_copyFrom(proxy);
    }
}
/// \endcond

::Ice::AsyncResultPtr
IceProxy::Ice::PropertiesAdmin::_iceI_begin_getProperty(const ::std::string& iceP_key, const ::Ice::Context& context, const ::IceInternal::CallbackBasePtr& del, const ::Ice::LocalObjectPtr& cookie, bool sync)
{
    _checkTwowayOnly(iceC_Ice_PropertiesAdmin_getProperty_name, sync);
    ::IceInternal::OutgoingAsyncPtr result = new ::IceInternal::CallbackOutgoing(this, iceC_Ice_PropertiesAdmin_getProperty_name, del, cookie, sync);
    try
    {
        result->prepare(iceC_Ice_PropertiesAdmin_getProperty_name, ::Ice::Normal, context);
        ::Ice::OutputStream* ostr = result->startWriteParams(::Ice::DefaultFormat);
        ostr->write(iceP_key);
        result->endWriteParams();
        result->invoke(iceC_Ice_PropertiesAdmin_getProperty_name);
    }
    catch(const ::Ice::Exception& ex)
    {
        result->abort(ex);
    }
    return result;
}

::std::string
IceProxy::Ice::PropertiesAdmin::end_getProperty(const ::Ice::AsyncResultPtr& result)
{
    ::Ice::AsyncResult::_check(result, this, iceC_Ice_PropertiesAdmin_getProperty_name);
    ::std::string ret;
    if(!result->_waitForResponse())
    {
        try
        {
            result->_throwUserException();
        }
        catch(const ::Ice::UserException& ex)
        {
            throw ::Ice::UnknownUserException(__FILE__, __LINE__, ex.ice_id());
        }
    }
    ::Ice::InputStream* istr = result->_startReadParams();
    istr->read(ret);
    result->_endReadParams();
    return ret;
}

::Ice::AsyncResultPtr
IceProxy::Ice::PropertiesAdmin::_iceI_begin_getPropertiesForPrefix(const ::std::string& iceP_prefix, const ::Ice::Context& context, const ::IceInternal::CallbackBasePtr& del, const ::Ice::LocalObjectPtr& cookie, bool sync)
{
    _checkTwowayOnly(iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name, sync);
    ::IceInternal::OutgoingAsyncPtr result = new ::IceInternal::CallbackOutgoing(this, iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name, del, cookie, sync);
    try
    {
        result->prepare(iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name, ::Ice::Normal, context);
        ::Ice::OutputStream* ostr = result->startWriteParams(::Ice::DefaultFormat);
        ostr->write(iceP_prefix);
        result->endWriteParams();
        result->invoke(iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name);
    }
    catch(const ::Ice::Exception& ex)
    {
        result->abort(ex);
    }
    return result;
}

::Ice::PropertyDict
IceProxy::Ice::PropertiesAdmin::end_getPropertiesForPrefix(const ::Ice::AsyncResultPtr& result)
{
    ::Ice::AsyncResult::_check(result, this, iceC_Ice_PropertiesAdmin_getPropertiesForPrefix_name);
    ::Ice::PropertyDict ret;
    if(!result->_waitForResponse())
    {
        try
        {
            result->_throwUserException();
        }
        catch(const ::Ice::UserException& ex)
        {
            throw ::Ice::UnknownUserException(__FILE__, __LINE__, ex.ice_id());
        }
    }
    ::Ice::InputStream* istr = result->_startReadParams();
    istr->read(ret);
    result->_endReadParams();
    return ret;
}

::Ice::AsyncResultPtr
IceProxy::Ice::PropertiesAdmin::_iceI_begin_setProperties(const ::Ice::PropertyDict& iceP_newProperties, const ::Ice::Context& context, const ::IceInternal::CallbackBasePtr& del, const ::Ice::LocalObjectPtr& cookie, bool sync)
{
    ::IceInternal::OutgoingAsyncPtr result = new ::IceInternal::CallbackOutgoing(this, iceC_Ice_PropertiesAdmin_setProperties_name, del, cookie, sync);
    try
    {
        result->prepare(iceC_Ice_PropertiesAdmin_setProperties_name, ::Ice::Normal, context);
        ::Ice::OutputStream* ostr = result->startWriteParams(::Ice::DefaultFormat);
        ostr->write(iceP_newProperties);
        result->endWriteParams();
        result->invoke(iceC_Ice_PropertiesAdmin_setProperties_name);
    }
    catch(const ::Ice::Exception& ex)
    {
        result->abort(ex);
    }
    return result;
}

void
IceProxy::Ice::PropertiesAdmin::end_setProperties(const ::Ice::AsyncResultPtr& result)
{
    _end(result, iceC_Ice_PropertiesAdmin_setProperties_name);
}

/// \cond INTERNAL
::IceProxy::Ice::Object*
IceProxy::Ice::PropertiesAdmin::_newInstance() const
{
    return new PropertiesAdmin;
}
/// \endcond

const ::std::string&
IceProxy::Ice::PropertiesAdmin::ice_staticId()
{
    return ::Ice::PropertiesAdmin::ice_staticId();
}

Ice::PropertiesAdmin::~PropertiesAdmin()
{
}

/// \cond INTERNAL
ICE_API ::Ice::Object* Ice::upCast(PropertiesAdmin* p) { return p; }

/// \endcond

namespace
{
const ::std::string iceC_Ice_PropertiesAdmin_ids[2] =
{
    "::Ice::Object",
    "::Ice::PropertiesAdmin"
};

}

bool
Ice::PropertiesAdmin::ice_isA(const ::std::string& s, const Current&) const
{
    return ::std::binary_search(iceC_Ice_PropertiesAdmin_ids, iceC_Ice_PropertiesAdmin_ids + 2, s);
}

::std::vector< ::std::string>
Ice::PropertiesAdmin::ice_ids(const Current&) const
{
    return ::std::vector< ::std::string>(&iceC_Ice_PropertiesAdmin_ids[0], &iceC_Ice_PropertiesAdmin_ids[2]);
}

const ::std::string&
Ice::PropertiesAdmin::ice_id(const Current&) const
{
    return ice_staticId();
}

const ::std::string&
Ice::PropertiesAdmin::ice_staticId()
{
#ifdef ICE_HAS_THREAD_SAFE_LOCAL_STATIC
    static const ::std::string typeId = "::Ice::PropertiesAdmin";
    return typeId;
#else
    return iceC_Ice_PropertiesAdmin_ids[1];
#endif
}

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceD_getProperty(::IceInternal::Incoming& inS, const Current& current)
{
    _iceCheckMode(::Ice::Normal, current.mode);
    InputStream* istr = inS.startReadParams();
    ::std::string iceP_key;
    istr->read(iceP_key);
    inS.endReadParams();
    ::std::string ret = this->getProperty(iceP_key, current);
    OutputStream* ostr = inS.startWriteParams();
    ostr->write(ret);
    inS.endWriteParams();
    return true;
}
/// \endcond

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceD_getPropertiesForPrefix(::IceInternal::Incoming& inS, const Current& current)
{
    _iceCheckMode(::Ice::Normal, current.mode);
    InputStream* istr = inS.startReadParams();
    ::std::string iceP_prefix;
    istr->read(iceP_prefix);
    inS.endReadParams();
    PropertyDict ret = this->getPropertiesForPrefix(iceP_prefix, current);
    OutputStream* ostr = inS.startWriteParams();
    ostr->write(ret);
    inS.endWriteParams();
    return true;
}
/// \endcond

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceD_setProperties(::IceInternal::Incoming& inS, const Current& current)
{
    _iceCheckMode(::Ice::Normal, current.mode);
    InputStream* istr = inS.startReadParams();
    PropertyDict iceP_newProperties;
    istr->read(iceP_newProperties);
    inS.endReadParams();
    this->setProperties(iceP_newProperties, current);
    inS.writeEmptyParams();
    return true;
}
/// \endcond

namespace
{
const ::std::string iceC_Ice_PropertiesAdmin_all[] =
{
    "getPropertiesForPrefix",
    "getProperty",
    "ice_id",
    "ice_ids",
    "ice_isA",
    "ice_ping",
    "setProperties"
};

}

/// \cond INTERNAL
bool
Ice::PropertiesAdmin::_iceDispatch(::IceInternal::Incoming& in, const Current& current)
{
    ::std::pair<const ::std::string*, const ::std::string*> r = ::std::equal_range(iceC_Ice_PropertiesAdmin_all, iceC_Ice_PropertiesAdmin_all + 7, current.operation);
    if(r.first == r.second)
    {
        throw OperationNotExistException(__FILE__, __LINE__, current.id, current.facet, current.operation);
    }

    switch(r.first - iceC_Ice_PropertiesAdmin_all)
    {
        case 0:
        {
            return _iceD_getPropertiesForPrefix(in, current);
        }
        case 1:
        {
            return _iceD_getProperty(in, current);
        }
        case 2:
        {
            return _iceD_ice_id(in, current);
        }
        case 3:
        {
            return _iceD_ice_ids(in, current);
        }
        case 4:
        {
            return _iceD_ice_isA(in, current);
        }
        case 5:
        {
            return _iceD_ice_ping(in, current);
        }
        case 6:
        {
            return _iceD_setProperties(in, current);
        }
        default:
        {
            assert(false);
            throw OperationNotExistException(__FILE__, __LINE__, current.id, current.facet, current.operation);
        }
    }
}
/// \endcond

/// \cond STREAM
void
Ice::PropertiesAdmin::_iceWriteImpl(OutputStream* ostr) const
{
    ostr->startSlice(ice_staticId(), -1, true);
    StreamWriter< PropertiesAdmin, OutputStream>::write(ostr, *this);
    ostr->endSlice();
}

void
Ice::PropertiesAdmin::_iceReadImpl(InputStream* istr)
{
    istr->startSlice();
    StreamReader< PropertiesAdmin, InputStream>::read(istr, *this);
    istr->endSlice();
}
/// \endcond

/// \cond INTERNAL
void
Ice::_icePatchObjectPtr(PropertiesAdminPtr& handle, const ObjectPtr& v)
{
    handle = PropertiesAdminPtr::dynamicCast(v);
    if(v && !handle)
    {
        IceInternal::Ex::throwUOE(PropertiesAdmin::ice_staticId(), v);
    }
}
/// \endcond

namespace Ice
{
}

#endif
