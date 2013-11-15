//
//  TTakeMediaViewController.h
//  t2u
//
//  Created by ren pan on 13-7-18.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

@class TTakeMediaViewController;

typedef void(^takeMediaOpen)(TTakeMediaViewController* controller, BOOL successOpen);
typedef void(^takeMediaCancel)(TTakeMediaViewController* controller);
typedef void(^takeMediaGetImage)(TTakeMediaViewController* controller, BOOL success, UIImage* image, NSDictionary* info);
typedef void(^takeMediaGetVideo)(TTakeMediaViewController* controller, BOOL success, NSURL* videoURL, NSDictionary* info);



@interface TTakeMediaViewController : TObject
@property (nonatomic, strong) takeMediaOpen blockTakeMediaOpen;
@property (nonatomic, strong) takeMediaCancel blockTakeMediaCancel;
@property (nonatomic, strong) takeMediaGetImage blockTakeMediaGetImage;
@property (nonatomic, strong) takeMediaGetVideo blockTakeMediaGetVideo;

@property (nonatomic, assign) BOOL allowsEditingPhoto;
@property (nonatomic, assign) BOOL allowsEditingVideo;

- (void)setBlockTakeMediaOpen:(takeMediaOpen)blockTakeMediaOpen;
- (void)setBlockTakeMediaCancel:(takeMediaCancel)blockTakeMediaCancel;
- (void)setBlockTakeMediaGetImage:(takeMediaGetImage)blockTakeMediaGetImage;
- (void)setBlockTakeMediaGetVideo:(takeMediaGetVideo)blockTakeMediaGetVideo;

- (void)takePhoto;
- (void)choosePhoto;
@end
