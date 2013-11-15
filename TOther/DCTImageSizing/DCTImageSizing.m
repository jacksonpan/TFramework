//
//  DCTImageSizing.m
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTImageSizing.h"
#import "DCTContentSizer.h"

@implementation UIImage (DCTImageSizing)

- (UIImage *)dct_imageWithSize:(CGSize)size contentMode:(UIViewContentMode)contentMode {

	CGRect imageRect = [DCTContentSizer rectForOriginalSize:self.size desiredSize:size contentMode:contentMode];

	CGRect contextRect = CGRectMake(0.0f, 0.0f, size.width, size.height);
	CGRect intersectionRect = CGRectIntersection(imageRect, contextRect);
	BOOL isOpaque = (CGRectEqualToRect(contextRect, intersectionRect)
					 && ![self dctImageSizing_containsAlpha]);

	UIGraphicsBeginImageContextWithOptions(size, isOpaque, 0.0);
	[self drawInRect:imageRect];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();

	return image;
}

- (BOOL)dctImageSizing_containsAlpha {
	CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
	if (alphaInfo == kCGImageAlphaNone
		|| alphaInfo == kCGImageAlphaNoneSkipFirst
		||alphaInfo == kCGImageAlphaNoneSkipLast)
		return NO;

	return YES;
}

@end
