//
//  TLog.h
//  t2u
//
//  Created by ren pan on 13-7-2.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TObject.h"

#define TLOG_DEBUG      1
#if TLOG_DEBUG == 1
#define TLog_Rect(a)      [TLog rect:a]
#define TLog_ViewFrame(a)       [TLog viewFrame:a]
#define TLog_Object(a)      [TLog object:a]
#define TLog_String(a)      [TLog string:a]
#define TLog_BOOL(a)        [TLog bool:a]
#define TLog_Float(a)        [TLog float:a]
#define TLog_Int(a)        [TLog int:a]
#else
#define TLog_Rect(a)
#define TLog_ViewFrame(a)
#define TLog_Object(a)
#define TLog_String(a)
#define TLog_BOOL(a)
#define TLog_Float(a)
#define TLog_Int(a)
#endif

@interface TLog : TObject
+ (void)rect:(CGRect)rc;
+ (void)viewFrame:(UIView*)v;
+ (void)object:(id)object;
+ (void)string:(NSString*)str;
+ (void)bool:(BOOL)b;
+ (void)float:(CGFloat)f;
+ (void)int:(NSInteger)i;

+ (void)print_CGRect:(CGRect)rect;
+ (void)print_NSString:(NSString*)string;
@end
