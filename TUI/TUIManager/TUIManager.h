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
@property (nonatomic, assign) BOOL navigationBarTranslucent;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL isSupportAutorotate;

@property (nonatomic, strong) NSString* fontName;
@property (nonatomic, strong) NSString* boldFontName;
- (UIFont*)fontOfSize:(CGFloat)size;
- (UIFont*)boldFontOfSize:(CGFloat)size;
@end

@interface UILabel (TUIManager)

@end