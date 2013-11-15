//
//  TNavigationBar.m
//  t2u
//
//  Created by ren pan on 13-6-29.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TNavigationBar.h"
#import "TDevice.h"
#import "TColor.h"
#import "TUIManager.h"
#import "TImage.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface TNavigationBar ()
{

}
@property (nonatomic, strong) CALayer *colorLayer;
@end

static CGFloat const kDefaultColorLayerOpacity = 0.5f;
static CGFloat const kSpaceToCoverStatusBars = 20.0f;

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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self _init];
    }
    return self;
}

- (void)_init
{
    TUIManager* ui = [TUIManager current];
    if(ui.navbar_titleColor)
    {
        [self setTitleColor:ui.navbar_titleColor];
    }
}

- (void)setTitleColor:(UIColor*)color
{
    if(color)
    {
        NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithDictionary:self.titleTextAttributes];
        if([TDevice isIOS7])
        {
            [dict setObject:color forKey:NSForegroundColorAttributeName];
        }
        else
        {
            [dict setObject:color forKey:UITextAttributeTextColor];
            [dict setObject:[UIFont boldSystemFontOfSize:18] forKey:UITextAttributeFont];
        }
        
        self.titleTextAttributes = dict;
    }
}

- (void)setTBarTintColor:(UIColor *)barTintColor
{
#if 1
    if([TDevice isIOS7])
    {
        [[[self class] appearance] setBarTintColor:barTintColor];
    }
    else
    {
        [[[self class] appearance] setBackgroundImage:[TColor imageWithColor:barTintColor] forBarMetrics:UIBarMetricsDefault];
    }
#else
    // As of iOS 7.0.3, colors definitely seem a little bit more saturated.
    if([TDevice systemVersionGreaterThanOrEqual:@"7.0.3"])
    {
        [self setBarTintColor:barTintColor];
        // Override the opacity if wanted.
        if(self.overrideOpacity)
        {
            CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
            [barTintColor getRed:&red green:&green blue:&blue alpha:&alpha];
            [self setBarTintColor:[UIColor colorWithRed:red green:green blue:blue alpha:kDefaultNavigationBarAlpha]];
        }
    }
    else
    {
        if([TDevice isIOS7])
        {
            [self setBarTintColor:barTintColor];
            if (self.colorLayer == nil)
            {
                self.colorLayer = [CALayer layer];
                self.colorLayer.opacity = kDefaultColorLayerOpacity;
                [self.layer addSublayer:self.colorLayer];
            }
            self.colorLayer.backgroundColor = barTintColor.CGColor;
        }
        else
        {
            [[[self class] appearance] setBackgroundImage:[TColor imageWithColor:barTintColor] forBarMetrics:UIBarMetricsDefault];
        }
    }
#endif
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if(self.colorLayer != nil)
    {
        self.colorLayer.frame = CGRectMake(0, 0 - kSpaceToCoverStatusBars, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + kSpaceToCoverStatusBars);
        [self.layer insertSublayer:self.colorLayer atIndex:1];
    }
}

- (void)displayColorLayer:(BOOL)display
{
    self.colorLayer.hidden = !display;
}

@end
