//
//  TCache.m
//  t2u
//
//  Created by ren pan on 13-7-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TCache.h"
#import "TObject.h"
#import <CommonCrypto/CommonDigest.h>
#include <fcntl.h>
#include <unistd.h>
#import "TLog.h"

static TCache* static_current = nil;

@interface TCache ()
{
    NSCache* myCache;
}
@end

@implementation TCache
@synthesize folderName = _folderName;
+ (id)current
{
    @synchronized(self)
    {
        if(static_current == nil)
        {
            static_current = [[self alloc] init];
        }
        return static_current;
    }
}

- (void)_init
{
    if(myCache == nil)
    {
        myCache = [[NSCache alloc] init];
    }
}

- (NSString *)cacheFolder
{
    static NSString *cacheFolder;
    //static dispatch_once_t onceToken;
    //dispatch_once(&onceToken, ^
    {
        NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        cacheFolder = [cacheDir stringByAppendingPathComponent:_folderName];
        
        // ensure all cache directories are there (needed only once)
        NSError *error = nil;
        if(![[NSFileManager new] createDirectoryAtPath:cacheFolder withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"Failed to create cache directory at %@", cacheFolder);
        }
    }//);
    return cacheFolder;
}

// calculates the MD5 hash of a key
- (NSString *)md5StringForString:(NSString *)string
{
    const char *str = [string UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), r);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
}

- (void)clearDisk
{
    NSString* cachePath = [self cacheFolder];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:cachePath error:nil];
    [self cacheFolder];
}

- (void)clearMemory
{
    [myCache removeAllObjects];
}

- (void)clearAll
{
    [self clearMemory];
    [self clearDisk];
}

- (NSString*)keyWithURL:(NSString*)url
{
    return [self md5StringForString:url];
}

- (NSString *)pathWithKey:(NSString*)key
{
    NSString* tempPath = nil;
    if (key) {
        tempPath = [[self cacheFolder] stringByAppendingPathComponent:key];
    }
    return tempPath;
}

- (NSString*)pathWithURL:(NSString*)url
{
    return [self pathWithKey:[self keyWithURL:url]];
}

- (BOOL)checkImageExistWithURL:(NSString*)url
{
    NSString* path = [self pathWithURL:url];
    NSFileManager* fm = [NSFileManager defaultManager];
    BOOL ret = NO;
    if([fm fileExistsAtPath:path])
    {
        ret = YES;
    }
    return ret;
}

- (BOOL)checkImageExistWithKey:(NSString*)key
{
    NSString* path = [self pathWithKey:key];
    NSFileManager* fm = [NSFileManager defaultManager];
    BOOL ret = NO;
    if([fm fileExistsAtPath:path])
    {
        ret = YES;
    }
    return ret;
}

- (UIImage*)diskImageForKey:(NSString*)key
{
    // Second check the disk cache...
    BOOL exist = [self checkImageExistWithKey:key];
    if(exist == NO)
    {
        return nil;
    }
    
    UIImage *diskImage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfFile:[self pathWithKey:key]]];
    
    return diskImage;
}

- (void)diskImage:(UIImage*)image forKey:(NSString*)key
{
    [self dispatchAsyncBackgroundWithBlock:^{
        NSData *data = nil;
        if(image)
        {
            data = UIImageJPEGRepresentation(image, (CGFloat)0.9);
        }
        if (data)
        {
            // Can't use defaultManager another thread
            NSFileManager *fileManager = NSFileManager.new;
            [fileManager createFileAtPath:[self pathWithKey:key] contents:data attributes:nil];
        }
    }];
}

- (UIImage*)cacheImageForKey:(NSString*)key
{
	return [myCache objectForKey:key];
}

- (void)cacheImage:(UIImage*)image forKey:(NSString*)key
{
    [myCache setObject:image forKey:key];
}

- (UIImage*)imageWithKey:(NSString*)key
{
    UIImage* image = [self cacheImageForKey:key];
    if(image == nil)
    {
        image = [self diskImageForKey:key];
    }
    return image;
}

- (UIImage*)imageWithURL:(NSString*)url
{
    if(url == nil)
    {
        NSLog(@"imageWithURL: url is nil can't load");
        return nil;
    }
    NSString* key = [self keyWithURL:url];
    UIImage* image = [self cacheImageForKey:key];
    if(image == nil)
    {
        image = [self diskImageForKey:key];
    }
    return image;
}

- (void)image:(UIImage*)image forKey:(NSString*)key
{
    [self diskImage:image forKey:key];
}

- (void)image:(UIImage *)image forURL:(NSString*)url
{
    NSString* key = [self keyWithURL:url];
    [self diskImage:image forKey:key];
}

- (void)clearImageForURL:(NSString*)url
{
    NSString* path = [self pathWithURL:url];
    NSFileManager* fm = [NSFileManager defaultManager];
    if([fm fileExistsAtPath:path])
    {
        NSError* err = nil;
        [fm removeItemAtPath:path error:&err];
        if(err)
        {
            TLog_Object(err);
        }
    }
}
@end
