//
//  TDevice.m
//  T
//
//  Created by jacksonpan on 13-5-24.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TDevice.h"

@implementation TDevice

+ (BOOL)isIOS7
{
    UIDevice* device = [UIDevice currentDevice];
    NSString* systemVersion = device.systemVersion;
    BOOL ret = YES;
    if([systemVersion floatValue] < 7.0f)
    {
        ret = NO;
    }
    return ret;
}

+ (ENUM_T_DEVICE)device
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return ENUM_T_DEVICE_IPAD;
    }
    else
    {
        if ([UIScreen mainScreen].bounds.size.height == 568.0) {
            return ENUM_T_DEVICE_IPHONE_4_0_INCH;
        }
        else {
            return ENUM_T_DEVICE_IPHONE_3_5_INCH;
        }
    }
}

+ (BOOL)isRetina
{
    return [UIScreen mainScreen].scale == 2.0;
}

+ (int)screenWidth
{
    return [UIScreen mainScreen].bounds.size.width;
}

+ (int)screenHeight
{
    return [UIScreen mainScreen].bounds.size.height;
}

+ (NSInteger)appWidth
{
    return [UIScreen mainScreen].applicationFrame.size.width;
}

+ (NSInteger)appHeight
{
    return [UIScreen mainScreen].applicationFrame.size.height;
}

+ (CGRect)appRect
{
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    appFrame.origin.x = 0;
    appFrame.origin.y = 0;
    return appFrame;
}
@end
