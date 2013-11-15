//
//  TDevice.h
//  T
//
//  Created by jacksonpan on 13-5-24.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TObject.h"

/// Type for logical screen size (there are actual three possible logical screen sizes on iOS).
typedef enum _ENUM_T_DEVICE
{
    ENUM_T_DEVICE_IPHONE_3_5_INCH, // All iPhones before iPhone 5
    ENUM_T_DEVICE_IPHONE_4_0_INCH, // iPhone 5
    ENUM_T_DEVICE_IPAD             // All iPads
}ENUM_T_DEVICE;

@interface TDevice : TObject

+ (CGFloat)iOSVersion;

+ (BOOL)isJailbroken;

+ (BOOL)isIOS7;

+ (BOOL)systemVersionGreaterThanOrEqual:(NSString*)version;

/// Returns one of the three logical screen sizes.
+ (ENUM_T_DEVICE)device;

/// Returns YES if device has retina display.
+ (BOOL)isRetina;

/// Returns screen width
+ (int)screenWidth;

/// Returns screen height
+ (int)screenHeight;

+ (NSInteger)appWidth;

+ (NSInteger)appHeight;

+ (CGRect)appRect;
@end
