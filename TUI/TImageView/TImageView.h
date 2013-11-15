//
//  TImageView.h
//  t2u
//
//  Created by ren pan on 13-7-10.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TImageDownloadProgressCompletionBlock)(NSURL *imageURL, BOOL success, NSError *error, UIImage* image);

@interface UIImageView (TImageView)

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage;

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage completion:(TImageDownloadProgressCompletionBlock)completion;

- (void)setImageWithURL:(NSURL *)imageURL
       placeholderImage:(UIImage *)placeholderImage
             completion:(TImageDownloadProgressCompletionBlock)completion
               progress:(void (^)(NSURL* imageURL, CGFloat percent))progress;

- (void)setImageWithURL:(NSURL *)imageURL
       placeholderImage:(UIImage *)placeholderImage
             completion:(TImageDownloadProgressCompletionBlock)completion
               progress:(void (^)(NSURL* imageURL, CGFloat percent))progress
          startDownload:(void (^)())startDownload
            endDownload:(void (^)(BOOL success))endDownload;

- (void)cancelImageRequestOperation;
@end
