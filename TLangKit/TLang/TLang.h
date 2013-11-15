//
//  TLang.h
//  t2u
//
//  Created by ren pan on 13-7-3.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

//#define TLangString(text)                   NSLocalizedString(text, nil)
//#define TLangStringFromTable(text, table)   NSLocalizedStringFromTable(text, table, nil)
//#define TLangGeneralString(textID)          [[TLang generalLang] string:textID]

@interface TLang : TObject
@property (nonatomic, strong) NSString* tableForString;
+ (TLang*)generalLang;
+ (TLang*)TLangString;

+ (NSString*)stringFromDefaultTable:(NSString*)textID;
+ (NSString*)stringFromTable:(NSString*)tableForString textID:(NSString*)textID;

- (NSString*)string:(NSString*)textID;
- (NSString*)string:(NSString*)textID fromTable:(NSString*)table;
+ (NSString*)string:(NSString*)textID;
+ (NSString*)string:(NSString*)textID fromTable:(NSString*)table;

+ (BOOL)isChinese;
@end

#define TLangLoad(textID)                     [[TLang TLangString] string:textID]
#define TLangLoadDefault(textID)              [[TLang new] string:textID]
#define TLangLoadFromTable(textID, table)     [TLang string:textID fromTable:table]

