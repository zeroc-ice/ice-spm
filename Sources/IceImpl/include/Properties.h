//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

#import "LocalObject.h"

NS_ASSUME_NONNULL_BEGIN

ICEIMPL_API @interface ICEProperties : ICELocalObject
-(nonnull NSString*) getProperty:(NSString*)key;
-(nonnull NSString*) getPropertyWithDefault:(NSString*)key value:(NSString*)value;
-(int32_t) getPropertyAsInt:(NSString*)key;
-(int32_t)  getPropertyAsIntWithDefault:(NSString*)key value:(int32_t)value NS_SWIFT_NAME(getPropertyAsIntWithDefault(key:value:));
-(nonnull NSArray<NSString*>*) getPropertyAsList:(NSString* _Nonnull)key;
-(nonnull NSArray<NSString*>*) getPropertyAsListWithDefault:(NSString* _Nonnull)key value:(NSArray<NSString*>* _Nonnull)value NS_SWIFT_NAME(getPropertyAsListWithDefault(key:value:));
-(nonnull NSDictionary<NSString*, NSString*>*) getPropertiesForPrefix:(NSString* _Nonnull)prefix NS_SWIFT_NAME(getPropertiesForPrefix(_:));
-(BOOL) setProperty:(NSString*)key value:(NSString*)value error:(NSError**)error;
-(nonnull NSArray<NSString*>*) getCommandLineOptions;
-(nullable NSArray<NSString*>*) parseCommandLineOptions:(NSString*)prefix options:(NSArray<NSString*>*)options error:(NSError* _Nullable * _Nullable)error;
-(nullable NSArray<NSString*>*) parseIceCommandLineOptions:(NSArray<NSString*>*)options error:(NSError**)error;
-(BOOL) load:(NSString*)file error:(NSError* _Nullable * _Nullable)error;
-(nonnull ICEProperties*) clone;
@end

#ifdef __cplusplus

@interface ICEProperties()
@property (nonatomic, readonly) std::shared_ptr<Ice::Properties> properties;
@end

#endif

NS_ASSUME_NONNULL_END
