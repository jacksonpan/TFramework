//
//  UIImageView+TImageDownloadProgress.m
//  t2u
//
//  Created by ren pan on 13-7-10.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TImageView.h"
#import "TCache.h"
#import <objc/runtime.h>
#import "AFImageRequestOperation.h"
//#import "UIImageView+AFNetworking.h"

static char kAFImageRequestOperationObjectKey;
static char lastProgressObjectKey;

@interface UIImageView (TImageView_progress)
@property (readwrite, nonatomic, strong, setter = af_setImageRequestOperation:) AFImageRequestOperation *af_imageRequestOperation;
@property (nonatomic, strong, setter = lastProgress:) NSNumber* lastProgress;
@end

@implementation UIImageView (TImageView_progress)
@dynamic af_imageRequestOperation;
@dynamic lastProgress;
@end

#pragma mark -

@implementation UIImageView (TImageView)

- (AFHTTPRequestOperation *)af_imageRequestOperation {
    return (AFHTTPRequestOperation *)objc_getAssociatedObject(self, &kAFImageRequestOperationObjectKey);
}

- (void)af_setImageRequestOperation:(AFImageRequestOperation *)imageRequestOperation {
    objc_setAssociatedObject(self, &kAFImageRequestOperationObjectKey, imageRequestOperation, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber*)lastProgress
{
    return (NSNumber*)objc_getAssociatedObject(self, &lastProgressObjectKey);
}

- (void)lastProgress:(NSNumber *)lastProgress
{
    objc_setAssociatedObject(self, &lastProgressObjectKey, lastProgress, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (NSOperationQueue *)af_sharedImageRequestOperationQueue {
    static NSOperationQueue *_af_imageRequestOperationQueue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _af_imageRequestOperationQueue = [[NSOperationQueue alloc] init];
        [_af_imageRequestOperationQueue setMaxConcurrentOperationCount:NSOperationQueueDefaultMaxConcurrentOperationCount];
    });
    
    return _af_imageRequestOperationQueue;
}

#pragma mark -

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage
{
    [self setImageWithURL:url placeholderImage:placeholderImage completion:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholderImage completion:(TImageDownloadProgressCompletionBlock)completion
{
    [self setImageWithURL:url placeholderImage:placeholderImage completion:nil progress:nil];
}

- (void)setImageWithURL:(NSURL *)imageURL
       placeholderImage:(UIImage *)placeholderImage
             completion:(TImageDownloadProgressCompletionBlock)completion
               progress:(void (^)(NSURL* imageURL, CGFloat percent))progress
{
    [self setImageWithURL:imageURL placeholderImage:placeholderImage completion:completion progress:progress startDownload:nil endDownload:nil];
}

- (void)setImageWithURL:(NSURL *)imageURL
       placeholderImage:(UIImage *)placeholderImage
             completion:(TImageDownloadProgressCompletionBlock)completion
               progress:(void (^)(NSURL* imageURL, CGFloat percent))progress
          startDownload:(void (^)())startDownload
            endDownload:(void (^)(BOOL success))endDownload
{
    [self cancelImageRequestOperation];
    
    TCache* cache = [TCache current];
    UIImage* cachedImage = [cache imageWithURL:[imageURL absoluteString]];
    if(cachedImage)
    {
        if(endDownload)
        {
            endDownload(YES);
        }
        if (completion)
        {
            completion(imageURL, YES, nil, cachedImage);
        }
        else
        {
            self.image = cachedImage;
        }
        
        self.af_imageRequestOperation = nil;
    }
    else
    {
        self.image = placeholderImage;
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:imageURL];
        [urlRequest addValue:@"image/*" forHTTPHeaderField:@"Accept"];
        self.lastProgress = [NSNumber numberWithFloat:0];
        AFImageRequestOperation *requestOperation = [[AFImageRequestOperation alloc] initWithRequest:urlRequest];
        if(startDownload)
        {
            startDownload();
        }
        [requestOperation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
            float percentDone = totalBytesRead/(float)totalBytesExpectedToRead;
            CGFloat newProgress = [[NSString stringWithFormat:@"%0.2f", percentDone] floatValue];
            if(progress)
            {
                if(newProgress != [self.lastProgress floatValue])
                {
                    progress(imageURL, newProgress);
                    self.lastProgress = [NSNumber numberWithFloat:newProgress];
                }
            }
        }];
        [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            if ([urlRequest isEqual:[self.af_imageRequestOperation request]])
            {
                if(endDownload)
                {
                    endDownload(YES);
                }
                if (completion)
                {
                    completion([operation.request URL], YES, nil, responseObject);
                }
                else if (responseObject)
                {
                    self.image = responseObject;
                }
                
                if (self.af_imageRequestOperation == operation)
                {
                    self.af_imageRequestOperation = nil;
                }
            }
            [cache image:responseObject forURL:[[urlRequest URL] absoluteString]];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            if ([urlRequest isEqual:[self.af_imageRequestOperation request]])
            {
                if(endDownload)
                {
                    endDownload(NO);
                }
                if (completion)
                {
                    completion([operation.request URL], NO, error, nil);
                }
                
                if (self.af_imageRequestOperation == operation)
                {
                    self.af_imageRequestOperation = nil;
                }
            }
        }];
        
        self.af_imageRequestOperation = requestOperation;
        
        [[[self class] af_sharedImageRequestOperationQueue] addOperation:self.af_imageRequestOperation];
    }
}

- (void)cancelImageRequestOperation
{
    [self.af_imageRequestOperation cancel];
    self.af_imageRequestOperation = nil;
}
@end
