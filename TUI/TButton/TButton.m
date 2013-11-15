//
//  TButton.m
//  t2u
//
//  Created by ren pan on 13-7-26.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TButton.h"

@implementation TButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    
}

- (void)setText:(NSString*)text
{
    [self setTitle:text forState:UIControlStateNormal];
}

- (void)setImage:(UIImage*)image
{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setTextNormalColor:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTextHighlightColor:[self getHighlightColorWithColor:color]];
}

- (void)setTextHighlightColor:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateHighlighted];
}

- (UIColor*)getHighlightColorWithColor:(UIColor*)color
{
    UIColor *newColor;
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0, white = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    [color getWhite:&white alpha:&alpha];
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
    return newColor;
}
@end
