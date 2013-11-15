//
//  TNavigationLeftButton.m
//  vjmenu
//
//  Created by ren pan on 13-9-6.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TNavigationLeftButton.h"
#import "TUIManager.h"
#import "TDevice.h"
#import "TImage.h"

@implementation TNavigationLeftButton
- (void)initUI
{
    TUIManager* ui = [TUIManager current];
    if(ui.navbar_TintColor)
    {
        [self setTextNormalColor:ui.navbar_TintColor];
        [self setTintColor:ui.navbar_TintColor];
    }
    if(![TDevice isIOS7])
    {
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.titleLabel.font = [ui fontOfSize:16];
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    }
    [self sizeToFit];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image
{
    TUIManager* ui = [TUIManager current];
    UIImage* img = image;
    if(ui.navbar_TintColor)
    {
        img = [image imageWithGradientTintColor:ui.navbar_TintColor];
    }
    [super setImage:img];
    [self sizeToFit];
}
@end
