//
//  TTakeMediaViewController.m
//  t2u
//
//  Created by ren pan on 13-7-18.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TTakeMediaViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface TTakeMediaViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    
}
@property (nonatomic, strong) UIViewController* viewControllerForPresentingImagePickerController;
@property (nonatomic, strong) UIImagePickerController* imagePicker;
@end

@implementation TTakeMediaViewController
@synthesize blockTakeMediaOpen = _blockTakeMediaOpen;
@synthesize blockTakeMediaCancel = _blockTakeMediaCancel;
@synthesize blockTakeMediaGetImage = _blockTakeMediaGetImage;
@synthesize blockTakeMediaGetVideo = _blockTakeMediaGetVideo;

@synthesize allowsEditingPhoto = _allowsEditingPhoto;
@synthesize allowsEditingVideo = _allowsEditingVideo;
@synthesize viewControllerForPresentingImagePickerController = _viewControllerForPresentingImagePickerController;
@synthesize imagePicker = _imagePicker;

#pragma mark - Private methods

- (UIViewController*)presentingViewController
{
    // Use optional view controller for presenting the image picker if set
    UIViewController *presentingViewController = nil;
    if (self.viewControllerForPresentingImagePickerController!=nil) {
        presentingViewController = self.viewControllerForPresentingImagePickerController;
    }
    else {
        // Otherwise do this stuff (like in original source code)
        presentingViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    }
    return presentingViewController;
}

- (void)_init
{
    _allowsEditingPhoto = NO;
    _allowsEditingVideo = NO;
    _imagePicker = [[UIImagePickerController alloc] init];
    _imagePicker.delegate = self;
}

#pragma mark - Public methods

- (void)takePhoto
{
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        if(_blockTakeMediaOpen)
        {
            _blockTakeMediaOpen(self, NO);
        }
        return;
    }
    
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePicker.allowsEditing = _allowsEditingPhoto;
    _imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil];
    
    [[self presentingViewController] presentViewController:_imagePicker animated:YES completion:^{
        if(_blockTakeMediaOpen)
        {
            _blockTakeMediaOpen(self, YES);
        }
    }];
}

- (void)choosePhoto
{
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        if(_blockTakeMediaOpen)
        {
            _blockTakeMediaOpen(self, NO);
        }
        return;
    }
    
    _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    _imagePicker.allowsEditing = _allowsEditingPhoto;
    _imagePicker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil];
    
    [[self presentingViewController] presentViewController:_imagePicker animated:YES completion:^{
        if(_blockTakeMediaOpen)
        {
            _blockTakeMediaOpen(self, YES);
        }
    }];
}

#pragma mark - UIImagePickerController delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    if(CFStringCompare((CFStringRef)mediaType, kUTTypeImage, 0) == kCFCompareEqualTo)
    {
        editedImage = (UIImage*)[info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage*)[info objectForKey:UIImagePickerControllerOriginalImage];
        
        if (editedImage)
        {
            imageToSave = editedImage;
        }
        else if (originalImage)
        {
            imageToSave = originalImage;
        }
        else
        {
            if (_blockTakeMediaGetImage)
            {
                _blockTakeMediaGetImage(self, NO, nil, nil);
            }
            goto pickEnd;
        }
        
        if(_blockTakeMediaGetImage)
        {
            _blockTakeMediaGetImage(self, YES, imageToSave, info);
        }
    }
    // Handle a movie capture
    else if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo)
    {
        if(_blockTakeMediaGetImage)
        {
            _blockTakeMediaGetVideo(self, YES, [info objectForKey:UIImagePickerControllerMediaURL], info);
        }
    }
    
pickEnd:
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^{
        if(_blockTakeMediaCancel)
        {
            _blockTakeMediaCancel(self);
        }
    }];
}
@end
