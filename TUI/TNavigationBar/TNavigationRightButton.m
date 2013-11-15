//
//  TNavigationRightButton.m
//  vjmenu
//
//  Created by ren pan on 13-9-6.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TNavigationRightButton.h"
#import "TUIManager.h"
#import "TDevice.h"
#import "TImage.h"

@implementation TNavigationRightButton
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
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.titleLabel.font = [ui fontOfSize:17];
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 4);
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
