//
//  TTools.h
//  Tu
//
//  Created by jacksonpan on 13-4-13.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NULLString          @""
#define MTLang(text)        NSLocalizedString(text, text)
#define ENUM(a)             [NSNumber numberWithInt:a]
#define NSBOOL(a)           [NSNumber numberWithBool:a]
#define NSINT(a)            [NSNumber numberWithInt:a]

@interface TTools : NSObject
+ (void)idleTimerDisabled;
+ (void)idleTimerEnabled;

+ (NSString*)getCurrentTime;
+ (NSString*)getCurrentLanguage;

+ (CGFloat)getIOSVersion;
+ (BOOL)isJailbroken;

+ (void)appCallPhoneWithNum:(NSString*)_nums;
+ (void)appCallPhoneNoBackWithNum:(NSString*)_nums;

+ (void)appEvaluateWithAppID:(NSString*)_appID;
@end
