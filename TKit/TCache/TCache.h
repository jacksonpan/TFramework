//
//  TCache.h
//  t2u
//
//  Created by ren pan on 13-7-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

@interface TCache : TObject
@property (nonatomic, strong) NSString* folderName;

+ (id)current;

- (void)clearDisk;
- (void)clearMemory;
- (void)clearAll;
- (NSString*)keyWithURL:(NSString*)url;
- (NSString *)pathWithKey:(NSString*)key;
- (NSString*)pathWithURL:(NSString*)url;
- (BOOL)checkImageExistWithURL:(NSString*)url;
- (BOOL)checkImageExistWithKey:(NSString*)key;

- (UIImage*)diskImageForKey:(NSString*)key;
- (void)diskImage:(UIImage*)image forKey:(NSString*)key;

- (UIImage*)cacheImageForKey:(NSString*)key;
- (void)cacheImage:(UIImage*)image forKey:(NSString*)key;

- (UIImage*)imageWithKey:(NSString*)key;
- (UIImage*)imageWithURL:(NSString*)url;
- (void)image:(UIImage*)image forKey:(NSString*)key;
- (void)image:(UIImage *)image forURL:(NSString*)url;

- (void)clearImageForURL:(NSString*)url;
@end
