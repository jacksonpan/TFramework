//
//  TNavigationBar.h
//  t2u
//
//  Created by ren pan on 13-6-29.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const kDefaultNavigationBarAlpha = 0.70f;

@interface TNavigationBar : UINavigationBar

- (void)setTitleColor:(UIColor*)color;

- (void)setTBarTintColor:(UIColor *)barTintColor;

/**
 * If set to YES, this will override the opacity of the barTintColor and will set it to
 * the value contained in kDefaultNavigationBarAlpha.
 */
@property (nonatomic, assign) BOOL overrideOpacity;

/**
 * Determines whether or not the extra color layer should be displayed.
 * @param display a BOOL; YES for keeping it visible, NO to hide it.
 * @warning this method is not available in the actual implementation, and is only here for demonstration purposes.
 */
- (void)displayColorLayer:(BOOL)display;
@end
