//
//  TSMS.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-29.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TSMS.h"
#import <MessageUI/MessageUI.h>
#import "TAlertManager.h"
#import "TLang.h"

@interface TSMS () <MFMessageComposeViewControllerDelegate>

@end

@implementation TSMS

ShareInstanceDefine

@synthesize block_SMSFeedback = _block_SMSFeedback;

- (BOOL)canSendSMS
{
    return [MFMessageComposeViewController canSendText];
}

- (void)showMessageWithContent:(NSString*)content from:(UIViewController*)controller
{
    if([self canSendSMS] == NO)
    {
        [[TAlertManager current] showTipWithContent:TLangLoad(@"不支持发送短信，请检查您的设备是否联网") button:TLangLoad(@"好的") block:nil];
        return;
    }
    
    MFMessageComposeViewController* picker = [[MFMessageComposeViewController alloc] init];
    //picker.recipients = @[@"18621001141"];
    picker.body = content; // 默认信息内容
    picker.messageComposeDelegate = self;
    [controller presentViewController:picker animated:YES completion:nil];
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
        {
            
        }
            break;
        case MessageComposeResultSent:
        {
            if(_block_SMSFeedback)
            {
                _block_SMSFeedback(YES);
            }
        }
            break;
        case MessageComposeResultFailed:
        {
            if(_block_SMSFeedback)
            {
                _block_SMSFeedback(NO);
            }
        }
            break;
        default:
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
