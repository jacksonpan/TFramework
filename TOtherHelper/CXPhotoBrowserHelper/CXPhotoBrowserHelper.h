//
//  CXPhotoBrowserHelper.h
//  vjmenu
//
//  Created by jack on 13-9-18.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"
#import "CXPhotoBrowser.h"

#pragma mark - CXPhotoBrowserDataSource @required
typedef NSUInteger(^numberOfPhotosInPhotoBrowser)(CXPhotoBrowser* photoBrowser);
typedef id<CXPhotoProtocol>(^photoBrowserPhotoAtIndex)(CXPhotoBrowser* photoBrowser, NSUInteger index);
#pragma mark - CXPhotoBrowserDataSource @optional
typedef CGFloat(^heightForNavigationBarInInterfaceOrientation)(UIInterfaceOrientation orientation);
typedef CGFloat(^heightForToolBarInInterfaceOrientation)(UIInterfaceOrientation orientation);
typedef CXBrowserNavBarView*(^browserNavigationBarViewOfOfPhotoBrowser)(CXPhotoBrowser* photoBrowser, CGSize withSize);
typedef CXBrowserToolBarView*(^browserToolBarViewOfPhotoBrowser)(CXPhotoBrowser* photoBrowser, CGSize withSize);

#pragma mark - CXPhotoBrowserDelegate @optional
typedef void(^photoBrowserDidChangedToPageAtIndex)(CXPhotoBrowser* photoBrowser, NSInteger index);
typedef void(^photoBrowserDidFinishLoadingWithCurrentImage)(CXPhotoBrowser* photoBrowser, UIImage* currentImage);
typedef BOOL(^photoBrowserSupportReload)();

@interface CXPhotoBrowserHelper : TObject
@property (nonatomic, strong) numberOfPhotosInPhotoBrowser blockNumberOfPhotosInPhotoBrowser;
@property (nonatomic, strong) photoBrowserPhotoAtIndex blockPhotoBrowserPhotoAtIndex;
@property (nonatomic, strong) heightForNavigationBarInInterfaceOrientation blockHeightForNavigationBarInInterfaceOrientation;
@property (nonatomic, strong) heightForToolBarInInterfaceOrientation blockHeightForToolBarInInterfaceOrientation;
@property (nonatomic, strong) browserNavigationBarViewOfOfPhotoBrowser blockBrowserNavigationBarViewOfOfPhotoBrowser;
@property (nonatomic, strong) browserToolBarViewOfPhotoBrowser blockBrowserToolBarViewOfPhotoBrowser;
@property (nonatomic, strong) photoBrowserDidChangedToPageAtIndex blockPhotoBrowserDidChangedToPageAtIndex;
@property (nonatomic, strong) photoBrowserDidFinishLoadingWithCurrentImage blockPhotoBrowserDidFinishLoadingWithCurrentImage;
@property (nonatomic, strong) photoBrowserSupportReload blockPhotoBrowserSupportReload;

- (void)setBlockNumberOfPhotosInPhotoBrowser:(numberOfPhotosInPhotoBrowser)blockNumberOfPhotosInPhotoBrowser;
- (void)setBlockPhotoBrowserPhotoAtIndex:(photoBrowserPhotoAtIndex)blockPhotoBrowserPhotoAtIndex;
- (void)setBlockHeightForNavigationBarInInterfaceOrientation:(heightForNavigationBarInInterfaceOrientation)blockHeightForNavigationBarInInterfaceOrientation;
- (void)setBlockHeightForToolBarInInterfaceOrientation:(heightForToolBarInInterfaceOrientation)blockHeightForToolBarInInterfaceOrientation;
- (void)setBlockBrowserNavigationBarViewOfOfPhotoBrowser:(browserNavigationBarViewOfOfPhotoBrowser)blockBrowserNavigationBarViewOfOfPhotoBrowser;
- (void)setBlockBrowserToolBarViewOfPhotoBrowser:(browserToolBarViewOfPhotoBrowser)blockBrowserToolBarViewOfPhotoBrowser;
- (void)setBlockPhotoBrowserDidChangedToPageAtIndex:(photoBrowserDidChangedToPageAtIndex)blockPhotoBrowserDidChangedToPageAtIndex;
- (void)setBlockPhotoBrowserDidFinishLoadingWithCurrentImage:(photoBrowserDidFinishLoadingWithCurrentImage)blockPhotoBrowserDidFinishLoadingWithCurrentImage;
- (void)setBlockPhotoBrowserSupportReload:(photoBrowserSupportReload)blockPhotoBrowserSupportReload;

#pragma mark - main method
@property (nonatomic, strong) CXPhotoBrowser* curPhotoBrowser;
- (void)photoBrowserWithNumberOfPhotos:(numberOfPhotosInPhotoBrowser)numberOfPhotos photoAtIndex:(photoBrowserPhotoAtIndex)photoAtIndex;
@end
