//
//  TColor.m
//  vjmenu
//
//  Created by ren pan on 13-9-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TColor.h"

@implementation TColor
+ (UIColor*)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}
@end
