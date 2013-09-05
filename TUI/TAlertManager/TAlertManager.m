//
//  TAlertManager.m
//  vjmenu
//
//  Created by ren pan on 13-8-30.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TAlertManager.h"
#import "TLang.h"

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

- (void)showAlertTipWithContent:(NSString*)content button:(id)button block:(buttonCallback)block
{
    TLang* lang = [TLang generalLang];
    [self showAlertWithTitle:[lang string:@"i18n_general_phrase_tip"] content:content button:button block:block];
}
@end
