//
//  TObject.m
//  t2u
//
//  Created by ren pan on 13-6-28.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"
#import <objc/runtime.h>

@implementation TObject

+ (id)current
{
    return nil;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        [self _init];
    }
    return self;
}

- (void)_init
{
    
}

- (NSString *)nameWithInstance:(id)instance
{
    unsigned int numIvars = 0;
    NSString *key=nil;
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        if ((object_getIvar(self, thisIvar) == instance)) {
            key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
            break;
        }
    }
    free(ivars);
    return key;
}

- (NSArray*)dictionaryKeys
{
    unsigned int numIvars = 0;
    NSMutableArray* keys = [[NSMutableArray alloc] init];
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        NSString* key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        [keys addObject:key];
    }
    free(ivars);
    return keys;
}

- (NSArray*)dictionaryValues
{
    unsigned int numIvars = 0;
    NSMutableArray* keys = [[NSMutableArray alloc] init];
    NSMutableArray* values = [[NSMutableArray alloc] init];
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        NSString* key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        id value = object_getIvar(self, thisIvar);
        if(value == nil)
        {
            value = [NSNull null];
        }
        [values addObject:value];
        [keys addObject:key];
    }
    free(ivars);
    return values;
}

- (NSDictionary*)dictionaryWithAllKeys
{
    unsigned int numIvars = 0;
    NSMutableArray* keys = [[NSMutableArray alloc] init];
    NSMutableArray* values = [[NSMutableArray alloc] init];
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        NSString* key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        id value = object_getIvar(self, thisIvar);
        if(value == nil)
        {
            value = [NSNull null];
        }
        [values addObject:value];
        [keys addObject:key];
    }
    free(ivars);
    NSDictionary* ret = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    return ret;
}

- (NSDictionary*)dictionaryWithNotNullValueKeys
{
    unsigned int numIvars = 0;
    NSMutableArray* keys = [[NSMutableArray alloc] init];
    NSMutableArray* values = [[NSMutableArray alloc] init];
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        NSString* key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        id value = object_getIvar(self, thisIvar);
        if(value == nil)
        {
            continue;
        }
        [values addObject:value];
        [keys addObject:key];
    }
    free(ivars);
    NSDictionary* ret = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    return ret;
}

- (void)processWithDictionary:(NSDictionary*)data
{
    unsigned int numIvars = 0;
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        NSString* key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
        id value = [data objectForKey:key];
        if(value)
        {
            object_setIvar(self, thisIvar, value);
        }
    }
    free(ivars);
}

- (NSString*)description
{
    return [[self dictionaryWithAllKeys] description];
}
@end

@implementation NSObject (TObject_Add)
- (id)isNSNull
{
    if([self isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    else
    {
        return self;
    }
}
@end