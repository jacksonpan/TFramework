//
//  IDMPhotoBrowserHelper.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-16.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "IDMPhotoBrowserHelper.h"

@interface IDMPhotoBrowserHelper () <IDMPhotoBrowserDelegate>
{
    
}
@end

@implementation IDMPhotoBrowserHelper
ShareInstanceDefine

@synthesize block_photoBrowser_didShowPhotoAtIndex = _block_photoBrowser_didShowPhotoAtIndex;
@synthesize block_photoBrowser_didDismissAtPageIndex = _block_photoBrowser_didDismissAtPageIndex;
@synthesize block_photoBrowser_captionViewForPhotoAtIndex = _block_photoBrowser_captionViewForPhotoAtIndex;
@synthesize block_photoBrowser_didDismissActionSheetWithButtonIndex = _block_photoBrowser_didDismissActionSheetWithButtonIndex;

- (void)photoBrowser:(IDMPhotoBrowser *)photoBrowser didShowPhotoAtIndex:(NSUInteger)index
{
    if(_block_photoBrowser_didShowPhotoAtIndex)
    {
        _block_photoBrowser_didShowPhotoAtIndex(photoBrowser, index);
    }
}

- (void)photoBrowser:(IDMPhotoBrowser *)photoBrowser didDismissAtPageIndex:(NSUInteger)index
{
    if(_block_photoBrowser_didDismissAtPageIndex)
    {
        _block_photoBrowser_didDismissAtPageIndex(photoBrowser, index);
    }
}

- (void)photoBrowser:(IDMPhotoBrowser *)photoBrowser didDismissActionSheetWithButtonIndex:(NSUInteger)buttonIndex photoIndex:(NSUInteger)photoIndex
{
    if(_block_photoBrowser_didDismissActionSheetWithButtonIndex)
    {
        _block_photoBrowser_didDismissActionSheetWithButtonIndex(photoBrowser, buttonIndex, photoIndex);
    }
}

- (IDMCaptionView *)photoBrowser:(IDMPhotoBrowser *)photoBrowser captionViewForPhotoAtIndex:(NSUInteger)index
{
    if(_block_photoBrowser_captionViewForPhotoAtIndex)
    {
        return _block_photoBrowser_captionViewForPhotoAtIndex(photoBrowser, index);
    }
    else
    {
        return nil;
    }
}

#pragma mark - main method
@synthesize curPhotoBrowser = _curPhotoBrowser;

- (IDMPhotoBrowser*)photoBrowserWithPhotos:(NSArray*)photosArray
{
    self.curPhotoBrowser = [[IDMPhotoBrowser alloc] initWithPhotos:photosArray];
    self.curPhotoBrowser.delegate = self;
    self.curPhotoBrowser.wantsFullScreenLayout = YES;
    return self.curPhotoBrowser;
}

- (IDMPhotoBrowser*)photoBrowserWithPhotos:(NSArray*)photosArray animatedFromView:(UIView*)view
{
    self.curPhotoBrowser = [[IDMPhotoBrowser alloc] initWithPhotos:photosArray animatedFromView:view];
    self.curPhotoBrowser.delegate = self;
    self.curPhotoBrowser.wantsFullScreenLayout = YES;
    return self.curPhotoBrowser;
}

- (IDMPhotoBrowser*)photoBrowserWithPhotoURLs:(NSArray*)photoURLsArray
{
    self.curPhotoBrowser = [[IDMPhotoBrowser alloc] initWithPhotoURLs:photoURLsArray];
    self.curPhotoBrowser.delegate = self;
    self.curPhotoBrowser.wantsFullScreenLayout = YES;
    return self.curPhotoBrowser;
}

- (IDMPhotoBrowser*)photoBrowserWithPhotoURLs:(NSArray*)photoURLsArray animatedFromView:(UIView*)view
{
    self.curPhotoBrowser = [[IDMPhotoBrowser alloc] initWithPhotoURLs:photoURLsArray animatedFromView:view];
    self.curPhotoBrowser.delegate = self;
    self.curPhotoBrowser.wantsFullScreenLayout = YES;
    return self.curPhotoBrowser;
}
@end
