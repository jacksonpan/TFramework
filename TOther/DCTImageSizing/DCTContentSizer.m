//
//  DCTContentSizer.m
//  DCTImageSizing
//
//  Created by Daniel Tull on 07/07/2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "DCTContentSizer.h"

@implementation DCTContentSizer

+ (CGRect)rectForOriginalSize:(CGSize)originalSize
				  desiredSize:(CGSize)desiredSize
				  contentMode:(UIViewContentMode)contentMode {


	switch (contentMode) {
		case UIViewContentModeScaleToFill:
			return [self _scaleToFillRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeScaleAspectFit:
			return [self _scaleAspectFitRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeScaleAspectFill:
			return [self _scaleAspectFillRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeRedraw:
			return [self _redrawRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeCenter:
			return [self _centerRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeTop:
			return [self _topRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeBottom:
			return [self _bottomRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeLeft:
			return [self _leftRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeRight:
			return [self _rightRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeTopLeft:
			return [self _topLeftRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeTopRight:
			return [self _topRightRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeBottomLeft:
			return [self _bottomLeftRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		case UIViewContentModeBottomRight:
			return [self _bottomRightRectForOriginalSize:originalSize desiredSize:desiredSize];
			break;

		default:
			break;
	}

	return CGRectMake(0.0f, 0.0f, 0.0f, 0.0f);
}

+ (CGRect)_scaleToFillRectForOriginalSize:(CGSize)imageSize desiredSize:(CGSize)outputSize {
	return CGRectMake(0.0f, 0.0f, outputSize.width, outputSize.height);
}

+ (CGRect)_scaleAspectFitRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {

	CGFloat originalHeight = originalSize.height;
	CGFloat originalWidth = originalSize.width;
	CGFloat originalRatio = originalHeight/originalWidth;

	CGFloat desiredHeight = desiredSize.height;
	CGFloat desiredWidth = desiredSize.width;
	CGFloat desiredRatio = desiredHeight/desiredWidth;

	if (originalRatio < desiredRatio) {
		NSInteger newImageHeight = originalHeight * desiredWidth/originalWidth;
		NSInteger y = (NSInteger)(desiredHeight-newImageHeight)/2.0f;
		return CGRectMake(0.0f, y, desiredWidth, newImageHeight);

	} else if (originalRatio > desiredRatio) {
		NSInteger newImageWidth = originalWidth * desiredHeight/originalHeight;
		NSInteger x = (NSInteger)(desiredWidth-newImageWidth)/2.0f;
		return CGRectMake((CGFloat)x, 0.0f, (CGFloat)newImageWidth, desiredHeight);
	}

	return CGRectMake(0.0f, 0.0f, desiredWidth, desiredHeight);
}

+ (CGRect)_scaleAspectFillRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	CGFloat originalHeight = originalSize.height;
	CGFloat originalWidth = originalSize.width;
	CGFloat originalRatio = originalHeight/originalWidth;

	CGFloat desiredHeight = desiredSize.height;
	CGFloat desiredWidth = desiredSize.width;
	CGFloat desiredRatio = desiredHeight/desiredWidth;

	if (originalRatio < desiredRatio) {
		NSInteger newImageWidth = originalWidth * desiredHeight/originalHeight;
		NSInteger x = (NSInteger)(desiredWidth-newImageWidth)/2.0f;
		return CGRectMake((CGFloat)x, 0.0f, (CGFloat)newImageWidth, desiredHeight);

	} else if (originalRatio > desiredRatio) {
		NSInteger newImageHeight = originalHeight * desiredWidth/originalWidth;
		NSInteger y = (NSInteger)(desiredHeight-newImageHeight)/2.0f;
		return CGRectMake(0.0f, y, desiredWidth, newImageHeight);
	}

	return CGRectMake(0.0f, 0.0f, desiredWidth, desiredHeight);
}

+ (CGRect)_redrawRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	return CGRectMake(0.0f, 0.0f, originalSize.width, originalSize.height);
}

+ (CGRect)_centerRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger x = (desiredSize.width - originalSize.width) / 2;
	NSInteger y = (desiredSize.height - originalSize.height) / 2;
	return CGRectMake(x, y, originalSize.width, originalSize.height);
}

+ (CGRect)_topRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger x = (desiredSize.width - originalSize.width) / 2;
	return CGRectMake(x, 0.0f, originalSize.width, originalSize.height);
}

+ (CGRect)_bottomRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger x = (desiredSize.width - originalSize.width) / 2;
	NSInteger y = desiredSize.height - originalSize.height;
	return CGRectMake(x, y, originalSize.width, originalSize.height);
}

+ (CGRect)_leftRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger y = (desiredSize.height - originalSize.height) / 2;
	return CGRectMake(0.0f, y, originalSize.width, originalSize.height);
}

+ (CGRect)_rightRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger x = desiredSize.width - originalSize.width;
	NSInteger y = (desiredSize.height - originalSize.height) / 2;
	return CGRectMake(x, y, originalSize.width, originalSize.height);
}

+ (CGRect)_topLeftRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	return CGRectMake(0.0f, 0.0f, originalSize.width, originalSize.height);
}

+ (CGRect)_topRightRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger x = desiredSize.width - originalSize.width;
	return CGRectMake(x, 0.0f, originalSize.width, originalSize.height);
}

+ (CGRect)_bottomLeftRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger y = desiredSize.height - originalSize.height;
	return CGRectMake(0.0f, y, originalSize.width, originalSize.height);
}

+ (CGRect)_bottomRightRectForOriginalSize:(CGSize)originalSize desiredSize:(CGSize)desiredSize {
	NSInteger x = desiredSize.width - originalSize.width;
	NSInteger y = desiredSize.height - originalSize.height;
	return CGRectMake(x, y, originalSize.width, originalSize.height);
}

@end
