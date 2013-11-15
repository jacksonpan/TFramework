//
//  TUIManager.h
//  t2u
//
//  Created by ren pan on 13-7-19.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TObject.h"

@interface TUIManager : TObject
@property (nonatomic, assign) BOOL wantsFullScreenLayout;
@property (nonatomic, assign) BOOL isSupportAutorotate;
@property (nonatomic, assign) BOOL iOS7Style;//default NO
@property (nonatomic, strong) NSString* fontName;
@property (nonatomic, strong) NSString* boldFontName;
- (UIFont*)fontOfSize:(CGFloat)size;
- (UIFont*)boldFontOfSize:(CGFloat)size;

//NavigationBar
@property (nonatomic, assign) NSInteger navbar_style; //0, statusbar black; 1, statusbar white. default 0
@property (nonatomic, assign) BOOL navbar_translucent; //default YES
@property (nonatomic, strong) UIColor* navbar_titleColor;
@property (nonatomic, strong) UIColor* navbar_bgColor;
@property (nonatomic, strong) UIColor* navbar_bgColor_iOS7;
@property (nonatomic, strong) UIColor* navbar_TintColor;//include image text
@end

@interface UILabel (TUIManager)

@end