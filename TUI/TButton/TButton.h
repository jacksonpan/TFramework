//
//  TButton.h
//  t2u
//
//  Created by ren pan on 13-7-26.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TButton : UIButton
- (void)initUI;
- (void)setText:(NSString*)text;
- (void)setImage:(UIImage*)image;
- (void)setTextNormalColor:(UIColor*)color;
- (void)setTextHighlightColor:(UIColor*)color;
- (UIColor*)getHighlightColorWithColor:(UIColor*)color;
@end
