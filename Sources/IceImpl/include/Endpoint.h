//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#import "LocalObject.h"

NS_ASSUME_NONNULL_BEGIN

ICEIMPL_API @interface ICEEndpoint: ICELocalObject
-(NSString*) toString;
-(id) getInfo;
-(bool) isEqual:(ICEEndpoint* _Nullable)endpoint;
@end

ICEIMPL_API @interface ICEEndpointInfo: ICELocalObject
-(int16_t) getType;
-(BOOL) getDatagram;
-(BOOL) getSecure;
@end

ICEIMPL_API @protocol ICEEndpointInfoFactory
+(id) createTCPEndpointInfo:(ICEEndpointInfo*)handle
                 underlying:(id)underlying
                    timeout:(int32_t)timeout
                   compress:(BOOL)compress
                       host:(NSString*)host
                       port:(int32_t)port
              sourceAddress:(NSString*)sourceAddress;

+(id) createUDPEndpointInfo:(ICEEndpointInfo*)handle
                 underlying:(id)underlying
                    timeout:(int32_t)timeout
                   compress:(BOOL)compress
                       host:(NSString*)host
                       port:(int32_t)port
              sourceAddress:(NSString*)sourceAddress
             mcastInterface:(NSString*)mcastInterface
                   mcastTtl:(int32_t)mcastTtl;

+(id) createWSEndpointInfo:(ICEEndpointInfo*)handle
                underlying:(id)underlying
                   timeout:(int32_t)timeout
                  compress:(BOOL)compress
                  resource:(NSString*)resource;

+(id) createOpaqueEndpointInfo:(ICEEndpointInfo*)handle
                    underlying:(id)underlying
                       timeout:(int32_t)timeout
                      compress:(BOOL)compress
                 encodingMajor:(UInt8)encodingMajor
                 encodingMinor:(UInt8)encodingMinor
                      rawBytes:(NSData*)rawBytes;

+(id) createSSLEndpointInfo:(ICEEndpointInfo*)handle
                 underlying:(id)underlying
                    timeout:(int32_t)timeout
                   compress:(BOOL)compress;

#if TARGET_OS_IPHONE

+(id) createIAPEndpointInfo:(ICEEndpointInfo*)handle
                 underlying:(id)underlying
                    timeout:(int32_t)timeout
                   compress:(BOOL)compress
               manufacturer:(NSString*)manufacturer
                modelNumber:(NSString*)modelNumber
                       name:(NSString*)name
                   protocol:(NSString*)protocol;

#endif

@end

#ifdef __cplusplus

@interface ICEEndpoint()
@property (nonatomic, readonly) std::shared_ptr<Ice::Endpoint> endpoint;
+(nullable ICEEndpointInfo*) createEndpointInfo:(std::shared_ptr<Ice::EndpointInfo>)infoPtr NS_RETURNS_RETAINED;
@end

@interface ICEEndpointInfo()
@property (nonatomic, readonly) std::shared_ptr<Ice::EndpointInfo> info;
@end

#endif

NS_ASSUME_NONNULL_END
