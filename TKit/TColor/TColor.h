//
//  TColor.h
//  vjmenu
//
//  Created by ren pan on 13-9-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

@interface TColor : TObject
+ (UIColor*)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
