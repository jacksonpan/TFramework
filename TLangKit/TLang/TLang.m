//
//  TLang.m
//  t2u
//
//  Created by ren pan on 13-7-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TLang.h"

#define LANG_CHINESE_HANS           @"zh-Hans"
#define LANG_CHINESE_HANT           @"zh-Hant"

@implementation TLang
@synthesize tableForString = _tableForString;

ShareInstanceDefine

+ (TLang*)generalLang
{
    TLang* lang = [TLang new];
    [lang setTableForString:@"generalLangString"];
    return lang;
}

+ (TLang*)TLangString
{
    TLang* lang = [TLang new];
    [lang setTableForString:@"TLangString"];
    return lang;
}

- (NSString*)string:(NSString*)textID
{
    NSString* ret = nil;
    if(_tableForString)
    {
        ret = NSLocalizedStringFromTable(textID, _tableForString, textID);
    }
    else
    {
        ret = NSLocalizedString(textID, textID);
    }
    return ret;
}

- (NSString*)string:(NSString*)textID fromTable:(NSString*)table
{
    return NSLocalizedStringFromTable(textID, table, textID);
}

+ (NSString*)string:(NSString*)textID
{
    return NSLocalizedString(textID, textID);
}

+ (NSString*)string:(NSString*)textID fromTable:(NSString*)table
{
    return NSLocalizedStringFromTable(textID, table, textID);
}

- (void)_init
{

}

+ (NSString*)stringFromDefaultTable:(NSString*)textID
{
    return NSLocalizedString(textID, nil);
}

+ (NSString*)stringFromTable:(NSString*)tableForString textID:(NSString*)textID
{
    return NSLocalizedStringFromTable(textID, tableForString, nil);
}

+ (BOOL)isChinese
{
    NSArray* langs = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    NSString* curLang = [langs firstObject];
    BOOL ret = NO;
    if([curLang isEqualToString:LANG_CHINESE_HANS])
    {
        ret = YES;
    }
    else if([curLang isEqualToString:LANG_CHINESE_HANT])
    {
        ret = YES;
    }
    return ret;
}

@end
