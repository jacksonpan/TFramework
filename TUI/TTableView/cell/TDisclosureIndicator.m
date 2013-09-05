//
//  TDisclosureIndicator.m
//  vjmenu
//
//  Created by ren pan on 13-8-11.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TDisclosureIndicator.h"


@implementation TDisclosureIndicator
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setBackgroundColor:[UIColor clearColor]];
        [self setColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* shadow = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.46];
    UIColor* chevronColor = self.color;
    
    //// Shadow Declarations
    CGSize shadowOffset = CGSizeMake(0.1, 1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// chevron Drawing
    UIBezierPath* chevronPath = [UIBezierPath bezierPath];
    [chevronPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.22000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01667 * CGRectGetHeight(frame))];
    [chevronPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.98000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48333 * CGRectGetHeight(frame))];
    [chevronPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.22000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98333 * CGRectGetHeight(frame))];
    [chevronPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.02000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81667 * CGRectGetHeight(frame))];
    [chevronPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.54000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48333 * CGRectGetHeight(frame))];
    [chevronPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.02000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.15000 * CGRectGetHeight(frame))];
    [chevronPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.22000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01667 * CGRectGetHeight(frame))];
    [chevronPath closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [chevronColor setFill];
    [chevronPath fill];
    CGContextRestoreGState(context);
}
@end
