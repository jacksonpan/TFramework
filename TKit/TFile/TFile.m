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

+ (NSString*)loadStringFromPath:(NSString*)path
{
    NSError* error = nil;
    NSString* ret = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    return ret;
}

+ (NSData*)loadDataFromPath:(NSString*)path
{
    NSData* ret = [[NSData alloc] initWithContentsOfFile:path];
    return ret;
}

+ (void)saveToDocumentWithData:(id)data name:(NSString*)name
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *realPath = [documentPath stringByAppendingPathComponent:name];
    NSError* error = nil;
    
    if(data == nil)
    {
        NSLog(@"No data, please check.");
        return;
    }
    if([data isKindOfClass:[NSString class]])
    {
        if([self checkFileExistWithPath:realPath])
        {
            [self removeFileWithPath:realPath];
        }
        [data writeToFile:realPath atomically:NO encoding:NSUTF8StringEncoding error:&error];
        if(error)
        {
            NSLog(@"%@", error);
        }
    }
    else if([data isKindOfClass:[NSData class]])
    {
        if([self checkFileExistWithPath:realPath])
        {
            [self removeFileWithPath:realPath];
        }
        [data writeToFile:realPath atomically:NO encoding:NSUTF8StringEncoding error:&error];
        if(error)
        {
            NSLog(@"%@", error);
        }
    }
    else
    {
        NSLog(@"unknow file please tell me. mail: 530933208@qq.com");
    }
}

+ (NSString*)getMainBundlePathWithName:(NSString*)name
{
    NSArray* nameext = [name componentsSeparatedByString:@"."];
    NSString* path = [[NSBundle mainBundle] pathForResource:nameext[0] ofType:nameext[1]];
    return path;
}

+ (NSString*)getDocumentPath
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return documentPath;
}

+ (NSString*)getDocumentPathWithPathComponent:(NSString*)path
{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *realPath = [documentPath stringByAppendingPathComponent:path];
    return realPath;
}

+ (BOOL)checkFileExistWithPath:(NSString*)path
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path])
    {
        return YES;
    }
    return NO;
}

+ (void)copyFileFrom:(NSString*)sourcePath to:(NSString*)realPath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError *error;
    if (![fileManager copyItemAtPath:sourcePath toPath:realPath error:&error]) {
        NSLog(@"%@",[error localizedDescription]);
    }
}

+ (void)removeFileWithPath:(NSString*)path
{
    NSError *error;
    NSFileManager* fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:path error:&error];
}
@end
