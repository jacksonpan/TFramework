//
//  DCTImageSizing.h
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifndef dctimagesizing
#define dctimagesizing_1_0     10000
#define dctimagesizing         dctimagesizing_1_0
#endif

@interface UIImage (DCTImageSizing)

- (UIImage *)dct_imageWithSize:(CGSize)size contentMode:(UIViewContentMode)contentMode;

@end
