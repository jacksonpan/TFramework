//
//  TLog.m
//  t2u
//
//  Created by ren pan on 13-7-2.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TLog.h"

@implementation TLog
+ (void)rect:(CGRect)rc
{
    CGFloat x,y,w,h;
    x = rc.origin.x;
    y = rc.origin.y;
    w = rc.size.width;
    h = rc.size.height;
    NSLog(@"TLog rect:\nx=%f, y=%f, w=%f, h=%f", x, y, w, h);
}

+ (void)viewFrame:(UIView*)v
{
    CGRect f = v.frame;
    CGFloat x,y,w,h;
    x = f.origin.x;
    y = f.origin.y;
    w = f.size.width;
    h = f.size.height;
    NSLog(@"TLog viewFrame:\nx=%f, y=%f, w=%f, h=%f", x, y, w, h);
}

+ (void)object:(id)object
{
    NSLog(@"TLog object:\n%@", object);
}

+ (void)string:(NSString*)str
{
    NSLog(@"TLog string:\n%@", str);
}

+ (void)bool:(BOOL)b
{
    NSLog(@"TLog bool:\n%d", b);
}

+ (void)float:(CGFloat)f
{
    NSLog(@"TLog float:\n%f", f);
}

+ (void)int:(NSInteger)i
{
    NSLog(@"TLog int:\n%d", i);
}

+ (void)print_CGRect:(CGRect)rect
{
    CGFloat x,y,w,h;
    x = rect.origin.x;
    y = rect.origin.y;
    w = rect.size.width;
    h = rect.size.height;
    NSLog(@"TLog print_CGRect:\nx=%f, y=%f, w=%f, h=%f", x, y, w, h);
}

+ (void)print_NSString:(NSString*)string
{
    NSLog(@"TLog print_NSString:\nstring=%@", string);
}
@end
