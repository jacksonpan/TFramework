//
//  CXPhotoBrowserHelper.m
//  vjmenu
//
//  Created by jack on 13-9-18.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "CXPhotoBrowserHelper.h"

@interface CXPhotoBrowserHelper () <CXPhotoBrowserDataSource, CXPhotoBrowserDelegate>

@end

@implementation CXPhotoBrowserHelper
ShareInstanceDefine

@synthesize blockNumberOfPhotosInPhotoBrowser = _blockNumberOfPhotosInPhotoBrowser;
@synthesize blockPhotoBrowserPhotoAtIndex = _blockPhotoBrowserPhotoAtIndex;
@synthesize blockHeightForNavigationBarInInterfaceOrientation = _blockHeightForNavigationBarInInterfaceOrientation;
@synthesize blockHeightForToolBarInInterfaceOrientation = _blockHeightForToolBarInInterfaceOrientation;
@synthesize blockBrowserNavigationBarViewOfOfPhotoBrowser =_blockBrowserNavigationBarViewOfOfPhotoBrowser;
@synthesize blockBrowserToolBarViewOfPhotoBrowser = _blockBrowserToolBarViewOfPhotoBrowser;
@synthesize blockPhotoBrowserDidChangedToPageAtIndex = _blockPhotoBrowserDidChangedToPageAtIndex;
@synthesize blockPhotoBrowserDidFinishLoadingWithCurrentImage = _blockPhotoBrowserDidFinishLoadingWithCurrentImage;
@synthesize blockPhotoBrowserSupportReload = _blockPhotoBrowserSupportReload;

#pragma mark - CXPhotoBrowserDataSource

- (NSUInteger)numberOfPhotosInPhotoBrowser:(CXPhotoBrowser *)photoBrowser
{
    if(_blockNumberOfPhotosInPhotoBrowser)
    {
        return _blockNumberOfPhotosInPhotoBrowser(photoBrowser);
    }
    return 0;
}

- (id <CXPhotoProtocol>)photoBrowser:(CXPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    if(_blockPhotoBrowserPhotoAtIndex)
    {
        return _blockPhotoBrowserPhotoAtIndex(photoBrowser, index);
    }
    return nil;
}

/*
- (CGFloat)heightForNavigationBarInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    
}

- (CGFloat)heightForToolBarInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    
}

- (CXBrowserNavBarView *)browserNavigationBarViewOfOfPhotoBrowser:(CXPhotoBrowser *)photoBrowser withSize:(CGSize)size
{
    
}

- (CXBrowserToolBarView *)browserToolBarViewOfPhotoBrowser:(CXPhotoBrowser *)photoBrowser withSize:(CGSize)size
{
    
}
 */

#pragma mark - CXPhotoBrowserDelegate

- (void)photoBrowser:(CXPhotoBrowser *)photoBrowser didChangedToPageAtIndex:(NSUInteger)index
{
    if(_blockPhotoBrowserDidChangedToPageAtIndex)
    {
        _blockPhotoBrowserDidChangedToPageAtIndex(photoBrowser, index);
    }
}

- (void)photoBrowser:(CXPhotoBrowser *)photoBrowser didFinishLoadingWithCurrentImage:(UIImage *)currentImage
{
    if(_blockPhotoBrowserDidFinishLoadingWithCurrentImage)
    {
        _blockPhotoBrowserDidFinishLoadingWithCurrentImage(photoBrowser, currentImage);
    }
}

- (BOOL)supportReload
{
    if(_blockPhotoBrowserSupportReload)
    {
        return _blockPhotoBrowserSupportReload();
    }
    return YES;
}

#pragma mark - main method
@synthesize curPhotoBrowser = _curPhotoBrowser;

- (void)photoBrowserWithNumberOfPhotos:(numberOfPhotosInPhotoBrowser)numberOfPhotos photoAtIndex:(photoBrowserPhotoAtIndex)photoAtIndex
{
    self.curPhotoBrowser = [[CXPhotoBrowser alloc] initWithDataSource:self delegate:self];
    [self setBlockNumberOfPhotosInPhotoBrowser:numberOfPhotos];
    [self setBlockPhotoBrowserPhotoAtIndex:photoAtIndex];
}
@end
