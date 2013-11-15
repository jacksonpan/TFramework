//
//  DCTContentSizer.h
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCTContentSizer : NSObject
+ (CGRect)rectForOriginalSize:(CGSize)originalSize
				  desiredSize:(CGSize)desiredSize
				  contentMode:(UIViewContentMode)contentMode;
@end
