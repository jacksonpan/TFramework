//
//  TJson.m
//  MT
//
//  Created by jacksonpan on 13-5-15.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TJson.h"

@interface TJson ()

@end

@implementation TJson
@synthesize stringEncoding;
ShareInstanceDefine
- (void)_init
{
    //stringEncoding = NSUTF8StringEncoding;
    stringEncoding = NSUTF8StringEncoding;
}
@end

@implementation NSString (TJson)
- (id)json
{
//    if([NSJSONSerialization isValidJSONObject:self] == NO)
//    {
//        return nil;
//    }
    NSError* err = nil;
    id ret = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:[[TJson current] stringEncoding]] options:NSJSONReadingAllowFragments error:&err];
    if(err)
    {
        NSLog(@"json error: %@", err);
    }
    return ret;
}
@end

@implementation NSData (TJson)
- (id)json
{
//    if([NSJSONSerialization isValidJSONObject:self] == NO)
//    {
//        return nil;
//    }
    NSError* err = nil;
    id ret = [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:&err];
    if(err)
    {
        NSLog(@"json error: %@", err);
    }
    return ret;
}
@end

@implementation NSDictionary (TJson)
- (NSData*)toJsonData
{
    if([NSJSONSerialization isValidJSONObject:self] == NO)
    {
        return nil;
    }
    NSError* err = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&err];
    if(err)
    {
        NSLog(@"toJsonString error: %@", err);
    }
    return data;
}

- (NSString*)toJsonString
{
    NSString* ret = nil;
    NSData* data = [self toJsonData];
    if(data)
    {
        ret = [[NSString alloc] initWithData:data encoding:[[TJson current] stringEncoding]];
    }
    return ret;
}
@end

@implementation NSArray (TJson)
- (NSData*)toJsonData
{
    if([NSJSONSerialization isValidJSONObject:self] == NO)
    {
        return nil;
    }
    NSError* err = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&err];
    if(err)
    {
        NSLog(@"toJsonString error: %@", err);
    }
    return data;
}

- (NSString*)toJsonString
{
    NSString* ret = nil;
    NSData* data = [self toJsonData];
    if(data)
    {
        ret = [[NSString alloc] initWithData:data encoding:[[TJson current] stringEncoding]];
    }
    return ret;
}
@end

@implementation NSNull (TJson)
- (NSData*)toJsonData
{
    if([NSJSONSerialization isValidJSONObject:self] == NO)
    {
        return nil;
    }
    NSError* err = nil;
    NSData* data = [NSJSONSerialization dataWithJSONObject:self options:0 error:&err];
    if(err)
    {
        NSLog(@"toJsonString error: %@", err);
    }
    return data;
}

- (NSString*)toJsonString
{
    NSString* ret = nil;
    NSData* data = [self toJsonData];
    if(data)
    {
        ret = [[NSString alloc] initWithData:data encoding:[[TJson current] stringEncoding]];
    }
    return ret;
}

- (id)json
{
    return self;
}
@end