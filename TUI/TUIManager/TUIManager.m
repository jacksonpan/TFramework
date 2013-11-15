//
//  TUIManager.m
//  t2u
//
//  Created by ren pan on 13-7-19.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TUIManager.h"
#import "TDevice.h"

@interface TUIManager ()
{
    
}

@end

@implementation TUIManager
@synthesize wantsFullScreenLayout = _wantsFullScreenLayout;
@synthesize isSupportAutorotate = _isSupportAutorotate;
@synthesize fontName = _fontName;
@synthesize boldFontName = _boldFontName;
@synthesize iOS7Style = _iOS7Style;
@synthesize navbar_translucent = _navbar_translucent;
@synthesize navbar_style = _navbar_style;

ShareInstanceDefine

- (void)_init
{
    _fontName = nil;
    _boldFontName = nil;
    
    _wantsFullScreenLayout = NO;
    _isSupportAutorotate = NO;
    
    _iOS7Style = NO;
    
    _navbar_translucent = YES;
    
    _navbar_style = 0;
}

- (void)setIOS7Style:(BOOL)iOS7Style
{
    _iOS7Style = iOS7Style;
    _fontName = @"Helvetica Neue";
    _boldFontName = @"HelveticaNeue-Bold";
}

- (UIFont*)fontOfSize:(CGFloat)size
{
    if([TDevice isIOS7] || _fontName == nil)
    {
        return [UIFont systemFontOfSize:size];
    }
    return [UIFont fontWithName:_fontName size:size];
}

- (UIFont*)boldFontOfSize:(CGFloat)size
{
    if([TDevice isIOS7] || _boldFontName == nil)
    {
        return [UIFont boldSystemFontOfSize:size];
    }
    return [UIFont fontWithName:_boldFontName size:size];
}
@end

@implementation UILabel (TUIManager)


@end
