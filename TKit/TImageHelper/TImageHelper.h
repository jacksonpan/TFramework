//
//  TImageHelper.h
//  MT
//
//  Created by ren pan on 13-6-17.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"

@interface TImageHelper : TObject
+ (NSData*)toJPGDataWithImagePath:(NSString*)imagePath compressionQuality:(CGFloat)compressionQuality;
+ (NSData*)toJPGDataWithImage:(UIImage*)image compressionQuality:(CGFloat)compressionQuality;
+ (UIImage*)toJPGWithImage:(UIImage*)image compressionQuality:(CGFloat)compressionQuality;
+ (NSData*)toJPGDataWithImagePath:(NSString*)imagePath;
+ (NSData*)toJPGDataWithImage:(UIImage*)image;
+ (UIImage*)toJPGWithImage:(UIImage*)image;
+ (NSData*)toPNGDataWithImage:(UIImage*)image;
+ (UIImage*)toPNGWithImage:(UIImage*)image;
+ (NSInteger)lengthWithJPGImagePath:(NSString*)imagePath;
+ (NSString*)lengthStrWithJPGImagePath:(NSString*)imagePath;
+ (NSInteger)lengthWithJPGImage:(UIImage*)image;
+ (NSInteger)lengthWithPNGImage:(UIImage*)image;

+ (UIImage*)thumbImage:(UIImage*)image;
@end
