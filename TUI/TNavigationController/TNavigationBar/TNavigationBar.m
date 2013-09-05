//
//  TNavigationBar.m
//  t2u
//
//  Created by ren pan on 13-6-29.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TNavigationBar.h"
#import "TUIManager.h"

@interface TNavigationBar ()
{

}
@end

@implementation TNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self _init];
    }
    return self;
}

- (void)awakeFromNib
{
    [self _init];
}

- (void)_init
{
    self.alpha = 1;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
#if 1
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0];
    
    [[UIColor colorWithRed:244.0f/255.0f green:244.0f/255.0f blue:244.0f/255.0f alpha:1] setFill];
    [path fill];
        
    CGContextRef ctx = UIGraphicsGetCurrentContext(); //获取上下文
    
    CGContextSetLineWidth(ctx, 1.0f); //设置线的宽度 为1个像素
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:191.0f/255.0f green:191.0f/255.0f blue:191.0f/255.0f alpha:1].CGColor); //设置线的颜色为灰色
    
    CGContextMoveToPoint(ctx, 0, self.bounds.size.height); //设置线的起始点
    
    CGContextAddLineToPoint(ctx, self.bounds.size.width, self.bounds.size.height); //设置线中间的一个点
    
    CGContextStrokePath(ctx);//直接把所有的点连起来
#else
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIImage *screenShot1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage* dd = [screenShot1 stackBlur:3];
    [dd drawInRect:rect];
#endif
}


@end
