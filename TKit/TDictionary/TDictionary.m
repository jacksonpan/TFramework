//
//  TDictionary.m
//  t2u
//
//  Created by jack on 13-9-10.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TDictionary.h"

@implementation NSDictionary (TDictionary)
+ (NSDictionary*)Objects:(NSArray*)objects keys:(NSArray*)keys
{
    NSDictionary* d = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    return d;
}
@end
