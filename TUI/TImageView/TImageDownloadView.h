//
//  TImageDownloadView.h
//  t2u
//
//  Created by ren pan on 13-7-11.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TImageView.h"

@class TImageDownloadView;

typedef void(^imageClick)(TImageDownloadView* imageDownloadView);

@interface TImageDownloadView : UIImageView
@property (nonatomic, strong) imageClick blockImageClick;
@property (nonatomic, strong) NSURL* imageURL;
- (void)setImageWithURL:(NSURL*)url placeholderImage:(UIImage*)placeholderImage completion:(TImageDownloadProgressCompletionBlock)completion;
- (void)setBlockImageClick:(imageClick)blockImageClick;
@end
