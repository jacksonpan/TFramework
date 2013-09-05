//
//  TUIManager.m
//  t2u
//
//  Created by ren pan on 13-7-19.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TUIManager.h"

@interface TUIManager ()
{
    
}

@end

@implementation TUIManager
@synthesize fontName = _fontName;
@synthesize boldFontName = _boldFontName;

ShareInstanceDefine

- (void)_init
{
    _fontName = @"Helvetica Neue";
    _boldFontName = @"HelveticaNeue-Bold";
    
    _wantsFullScreenLayout = NO;
    _navigationBarTranslucent = NO;
    _statusBarStyle = UIStatusBarStyleDefault;
    _isSupportAutorotate = NO;
}

- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    _statusBarStyle = statusBarStyle;
    [[UIApplication sharedApplication] setStatusBarStyle:statusBarStyle];
}

- (UIFont*)fontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:_fontName size:size];
}

- (UIFont*)boldFontOfSize:(CGFloat)size
{
    return [UIFont fontWithName:_boldFontName size:size];
}
@end

@implementation UILabel (TUIManager)


@end
