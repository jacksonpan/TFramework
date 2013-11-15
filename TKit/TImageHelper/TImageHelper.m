//
//  TImageHelper.m
//  MT
//
//  Created by ren pan on 13-6-17.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TImageHelper.h"
#import "TCache.h"
#import "UIImage+Resizing.h"

@implementation TImageHelper
+ (NSData*)toJPGDataWithImagePath:(NSString*)imagePath compressionQuality:(CGFloat)compressionQuality
{
    UIImage* image = [UIImage imageWithContentsOfFile:imagePath];
    return [self toJPGDataWithImage:image compressionQuality:compressionQuality];
}

+ (NSData*)toJPGDataWithImage:(UIImage*)image compressionQuality:(CGFloat)compressionQuality
{
    return UIImageJPEGRepresentation(image, compressionQuality);
}

+ (UIImage*)toJPGWithImage:(UIImage*)image compressionQuality:(CGFloat)compressionQuality
{
    NSData* data = [self toJPGDataWithImage:image compressionQuality:compressionQuality];
    UIImage* ret = [[UIImage alloc] initWithData:data];
    return ret;
}

+ (NSData*)toJPGDataWithImagePath:(NSString*)imagePath
{
    return [self toJPGDataWithImagePath:imagePath compressionQuality:0.9];
}

+ (NSData*)toJPGDataWithImage:(UIImage*)image
{
    return [self toJPGDataWithImage:image compressionQuality:0.9];
}

+ (UIImage*)toJPGWithImage:(UIImage*)image
{
    return [self toJPGWithImage:image compressionQuality:0.9];
}

+ (NSData*)toPNGDataWithImage:(UIImage*)image
{
    return UIImagePNGRepresentation(image);
}

+ (UIImage*)toPNGWithImage:(UIImage*)image
{
    NSData* data = [self toPNGDataWithImage:image];
    UIImage* ret = [[UIImage alloc] initWithData:data];
    return ret;
}

+ (NSInteger)lengthWithJPGImagePath:(NSString*)imagePath
{
    return [[self toJPGDataWithImagePath:imagePath] length];
}

+ (NSString*)lengthStrWithJPGImagePath:(NSString*)imagePath
{
    return [NSString stringWithFormat:@"%ld", (long)[self lengthWithJPGImagePath:imagePath]];
}

+ (NSInteger)lengthWithJPGImage:(UIImage*)image
{
    return [[self toJPGDataWithImage:image] length];
}

+ (NSInteger)lengthWithPNGImage:(UIImage*)image
{
    return [[self toPNGDataWithImage:image] length];
}

+ (UIImage*)thumbImage:(UIImage*)image
{
    if(image == nil)
    {
        return nil;
    }
    return [image scaleToFitSize:CGSizeMake(240, 320)];
}
@end
