//
//  IDMPhotoBrowserHelper.h
//  VJMenu_iOS7
//
//  Created by jack on 13-10-16.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"
#import "IDMPhotoBrowser.h"

typedef void(^photoBrowser_didShowPhotoAtIndex)(IDMPhotoBrowser* photoBrowser, NSUInteger index);
typedef void(^photoBrowser_didDismissAtPageIndex)(IDMPhotoBrowser* photoBrowser, NSUInteger index);
typedef void(^photoBrowser_didDismissActionSheetWithButtonIndex)(IDMPhotoBrowser* photoBrowser, NSUInteger buttonIndex, NSUInteger photoIndex);
typedef IDMCaptionView*(^photoBrowser_captionViewForPhotoAtIndex)(IDMPhotoBrowser* photoBrowser, NSUInteger captionViewForPhotoAtIndex);

@interface IDMPhotoBrowserHelper : TObject
@property (nonatomic, strong) photoBrowser_didShowPhotoAtIndex block_photoBrowser_didShowPhotoAtIndex;
@property (nonatomic, strong) photoBrowser_didDismissAtPageIndex block_photoBrowser_didDismissAtPageIndex;
@property (nonatomic, strong) photoBrowser_didDismissActionSheetWithButtonIndex block_photoBrowser_didDismissActionSheetWithButtonIndex;
@property (nonatomic, strong) photoBrowser_captionViewForPhotoAtIndex block_photoBrowser_captionViewForPhotoAtIndex;

- (void)setBlock_photoBrowser_didShowPhotoAtIndex:(photoBrowser_didShowPhotoAtIndex)block_photoBrowser_didShowPhotoAtIndex;
- (void)setBlock_photoBrowser_didDismissAtPageIndex:(photoBrowser_didDismissAtPageIndex)block_photoBrowser_didDismissAtPageIndex;
- (void)setBlock_photoBrowser_didDismissActionSheetWithButtonIndex:(photoBrowser_didDismissActionSheetWithButtonIndex)block_photoBrowser_didDismissActionSheetWithButtonIndex;
- (void)setBlock_photoBrowser_captionViewForPhotoAtIndex:(photoBrowser_captionViewForPhotoAtIndex)block_photoBrowser_captionViewForPhotoAtIndex;

#pragma mark - main method
@property (nonatomic, strong) IDMPhotoBrowser* curPhotoBrowser;
- (IDMPhotoBrowser*)photoBrowserWithPhotos:(NSArray*)photosArray;
- (IDMPhotoBrowser*)photoBrowserWithPhotos:(NSArray*)photosArray animatedFromView:(UIView*)view;
- (IDMPhotoBrowser*)photoBrowserWithPhotoURLs:(NSArray*)photoURLsArray;
- (IDMPhotoBrowser*)photoBrowserWithPhotoURLs:(NSArray*)photoURLsArray animatedFromView:(UIView*)view;
@end
