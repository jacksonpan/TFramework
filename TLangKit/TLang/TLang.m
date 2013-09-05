//
//  TLang.m
//  t2u
//
//  Created by ren pan on 13-7-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TLang.h"

@implementation TLang
@synthesize tableForString = _tableForString;

ShareInstanceDefine

+ (TLang*)generalLang
{
    TLang* lang = [TLang current];
    [lang setTableForString:@"generalLangString"];
    return lang;
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

- (NSString*)string:(NSString*)textID
{
    NSString* ret = nil;
    if(_tableForString)
    {
        ret = NSLocalizedStringFromTable(textID, _tableForString, nil);
    }
    else
    {
        ret = NSLocalizedString(textID, nil);
    }
    return ret;
}

- (NSString*)stringFromTable:(NSString*)tableForString textID:(NSString*)textID
{
    _tableForString = tableForString;
    return NSLocalizedStringFromTable(textID, tableForString, nil);
}
@end
