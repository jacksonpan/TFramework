//
//  TObject.h
//  t2u
//
//  Created by ren pan on 13-6-28.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ShareInstanceDefine
#define ShareInstanceDefine     + (id)current\
{\
static id static_shareInstance = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
static_shareInstance = [[[self class] alloc] init];\
});\
return static_shareInstance;\
}
#endif

@interface TObject : NSObject
+ (id)current;

- (void)_init;

- (NSString *)nameWithInstance:(id)instance;
- (NSArray*)dictionaryKeys;
- (NSArray*)dictionaryValues;
- (NSDictionary*)dictionaryWithAllKeys;
- (NSDictionary*)dictionaryWithNotNullValueKeys;

- (void)processWithDictionary:(NSDictionary*)data;
@end

@interface NSObject (TObject_Add)
//if is NSNull then return nil,else return self;
- (id)isNSNull;

- (void)dispatchAsyncWithPriority:(long)priority block:(void (^)())block;
- (void)dispatchAsyncLowWithBlock:(void (^)())block;
- (void)dispatchAsyncDefaultWithBlock:(void (^)())block;
- (void)dispatchAsyncHighWithBlock:(void (^)())block;
- (void)dispatchAsyncBackgroundWithBlock:(void (^)())block;
- (void)dispatchAsyncMainWithBlock:(void (^)())block;

- (NSString*)stringWithUUID;
@end