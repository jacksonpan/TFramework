//
//  TFlatButton.m
//  vjmenu
//
//  Created by jack on 13-9-18.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TFlatButton.h"
#import <QuartzCore/QuartzCore.h>

@interface TFlatButton ()

@end

@implementation TFlatButton
@synthesize originalBackgroundColor = _originalBackgroundColor;
@synthesize cornerRadius = _cornerRadius;

- (void)initUI
{
    [self addTarget:self action:@selector(wasPressed) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(endedPress) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(endedPress) forControlEvents:UIControlEventTouchUpOutside];
    
    self.opaque = YES;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 0;
}

- (void)setOriginalBackgroundColor:(UIColor *)originalBackgroundColor
{
    _originalBackgroundColor = originalBackgroundColor;
    self.backgroundColor = _originalBackgroundColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

- (void)wasPressed
{
    UIColor *newColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0, white = 0.0;
    [_originalBackgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
    [_originalBackgroundColor getWhite:&white alpha:&alpha];
    if(!(red + green + blue) && white)
    {
        newColor = [UIColor colorWithWhite:white - 0.2 alpha:alpha];
    }
    else if(!(red + green + blue) && !white)
    {
        newColor = [UIColor colorWithWhite:white + 0.2 alpha:alpha];
    }
    else
    {
        newColor = [UIColor colorWithRed:red - 0.2 green:green - 0.2 blue:blue - 0.2 alpha:alpha];
    }
    
    self.backgroundColor = newColor;
}

- (void)endedPress
{
    self.backgroundColor = _originalBackgroundColor;
}
@end
