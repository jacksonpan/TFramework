//
//  TFile.m
//  vjmenu
//
//  Created by ren pan on 13-9-2.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TFile.h"

@implementation TFile
ShareInstanceDefine

+ (NSString*)loadStringFromMainBundleWithName:(NSString*)name
{
    NSError* error = nil;
    NSArray* nameext = [name componentsSeparatedByString:@"."];
    NSString* path = [[NSBundle mainBundle] pathForResource:nameext[0] ofType:nameext[1]];
    NSString* ret = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    return ret;
}

+ (NSData*)loadDataFromMainBundleWithName:(NSString*)name
{
    NSArray* nameext = [name componentsSeparatedByString:@"."];
    NSString* path = [[NSBundle mainBundle] pathForResource:nameext[0] ofType:nameext[1]];
    NSData* ret = [[NSData alloc] initWithContentsOfFile:path];
    return ret;
}
@end
