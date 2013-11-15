//
//  TAlertManager.m
//  vjmenu
//
//  Created by ren pan on 13-8-30.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TAlertManager.h"
#import "TLang.h"
#import "SVProgressHUD.h"

@interface TAlertManager () <UIAlertViewDelegate>
{
    
}
@property (nonatomic, strong) buttonCallback blockbuttonCallback;
@end

@implementation TAlertManager
@synthesize blockbuttonCallback = _blockbuttonCallback;
ShareInstanceDefine

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(_blockbuttonCallback)
    {
        _blockbuttonCallback(buttonIndex);
    }
}

- (void)showAlertWithTitle:(NSString*)title content:(NSString*)content button:(id)button block:(buttonCallback)block
{
    _blockbuttonCallback = block;
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:content delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    if([button isKindOfClass:[NSString class]])
    {
        [alert addButtonWithTitle:button];
    }
    else if([button isKindOfClass:[NSArray class]])
    {
        for(NSString* t in button)
        {
            [alert addButtonWithTitle:t];
        }
    }
    else
    {
        return;
    }
    
    [alert show];
}

- (void)showTipWithContent:(NSString*)content button:(id)button block:(buttonCallback)block
{
    [self showAlertWithTitle:TLangLoad(@"提示") content:content button:button block:block];
}

- (void)showAlertWithContent:(NSString*)content button:(id)button block:(buttonCallback)block
{
     [self showAlertWithTitle:TLangLoad(@"警告") content:content button:button block:block];
}

- (void)showWaitWithTitle:(NSString*)title
{
     [SVProgressHUD showWithStatus:title maskType:SVProgressHUDMaskTypeBlack];
}

- (void)showProgressWithTitle:(NSString*)title progress:(CGFloat)progress
{
     [SVProgressHUD showProgress:progress status:title maskType:SVProgressHUDMaskTypeBlack];
}

- (void)hideCurrentHUD
{
     [SVProgressHUD dismiss];
}

- (void)showToastWithSuccessContent:(NSString*)content
{
     [SVProgressHUD showSuccessWithStatus:content];
}

- (void)showToastWithFailContent:(NSString*)content
{
     [SVProgressHUD showErrorWithStatus:content];
}
@end
