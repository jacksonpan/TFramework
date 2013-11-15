//
//  TImage.h
//  VJMenu_iOS7
//
//  Created by jack on 13-9-22.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TImage : UIImage

@end

@interface UIImage (Tint)
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
@end