//
//  TTools.m
//  Tu
//
//  Created by jacksonpan on 13-4-13.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TTools.h"

@implementation TTools
+ (void)idleTimerDisabled
{
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}

+ (void)idleTimerEnabled
{
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
}

+ (NSString*)getCurrentTime
{
    NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
    NSDate* today = [NSDate date];
    [fmt setDateFormat:@"yyyyMMddHHmmss"];
    NSString* date = [fmt stringFromDate:today];
    return date;
}

+ (NSString*)getCurrentLanguage
{
    NSString* lang = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
    //NSLog(@"all_support_language:%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]);
    return lang;
}

+ (CGFloat)getIOSVersion
{
    UIDevice* dev = [UIDevice currentDevice];
    return [[dev systemVersion] floatValue];
}

+ (BOOL)isJailbroken
{
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    return jailbroken;
}

+ (void)appCallPhoneWithNum:(NSString*)_nums
{
    NSString *num = [[NSString alloc] initWithFormat:@"telprompt://%@",_nums];;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
}

+ (void)appCallPhoneNoBackWithNum:(NSString*)_nums
{
    NSString *num = [[NSString alloc] initWithFormat:@"tel://%@",_nums];;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]];
}

@end
