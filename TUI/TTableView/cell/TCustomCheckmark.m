//
//  TCustomCheckmark.m
//  vjmenu
//
//  Created by ren pan on 13-8-11.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TCustomCheckmark.h"

@implementation TCustomCheckmark
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:NO];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    //// Color Declarations
    UIColor* checkMarkColor = self.color;
    
    //// Frames
    CGRect frame = self.bounds;
    
    
    //// checkMark Drawing
    UIBezierPath* checkMarkPath = [UIBezierPath bezierPath];
    [checkMarkPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07087 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48855 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.12500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.45284 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.21038 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.47898 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.15489 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43312 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.19312 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44482 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51450 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79528 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49163 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.89286 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.53176 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82945 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.52152 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.87313 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.38337 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96429 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.29800 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93814 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.35348 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98401 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.31526 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97230 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.04800 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58613 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07087 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48855 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.03074 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55196 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.04098 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50828 * CGRectGetHeight(frame))];
    [checkMarkPath closePath];
    [checkMarkPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.92048 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00641 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.93750 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02427 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.96038 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.12184 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.96739 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.04399 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.97764 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.08768 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51450 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93814 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.42913 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96429 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.49724 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97230 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.45902 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98401 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.32087 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.89286 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.29800 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79528 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.29098 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.87313 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.28074 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82945 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.83511 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.03255 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.92048 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00641 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.85237 * CGRectGetWidth(frame), CGRectGetMinY(frame) + -0.00161 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.89059 * CGRectGetWidth(frame), CGRectGetMinY(frame) + -0.01331 * CGRectGetHeight(frame))];
    [checkMarkPath closePath];
    [checkMarkPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.37500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78572 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.43750 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78572 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85714 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.47202 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78572 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81769 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.92857 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.43750 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 1.00000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96802 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.47202 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 1.00000 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.37500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 1.00000 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.31250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.92857 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.34048 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 1.00000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.31250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96802 * CGRectGetHeight(frame))];
    [checkMarkPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.31250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85714 * CGRectGetHeight(frame))];
    [checkMarkPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.37500 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78572 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.31250 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.34048 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78572 * CGRectGetHeight(frame))];
    [checkMarkPath closePath];
    [checkMarkColor setFill];
    [checkMarkPath fill];
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    [self setNeedsDisplay];
}
@end
