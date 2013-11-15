//
//  TNavigationBackButton.m
//  VJMenu_iOS7
//
//  Created by jack on 13-9-21.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TNavigationBackButton.h"
#import "TUIManager.h"
#import "TDevice.h"
#import "TLog.h"
#import "TImage.h"

@implementation TNavigationBackButton
- (void)initUI
{
    TUIManager* ui = [TUIManager current];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"UINavigationBarBackIndicatorDefault" ofType:@"png"];
    
    if(ui.navbar_TintColor)
    {
        [self setTintColor:ui.navbar_TintColor];
        [self setTextNormalColor:ui.navbar_TintColor];
        [self setImage:[[UIImage imageWithContentsOfFile:path] imageWithGradientTintColor:ui.navbar_TintColor]];
    }
    else
    {
        [self setImage:[UIImage imageWithContentsOfFile:path]];
    }
    
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.titleLabel.font = [ui fontOfSize:17];
    self.contentEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
    
    [self resetSize];
}

- (void)resetSize
{
    [self sizeToFit];
    CGRect f = self.frame;
    f.size.width += 10;
    self.frame = f;
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self resetSize];
}
@end
