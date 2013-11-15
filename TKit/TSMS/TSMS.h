//
//  TSMS.h
//  VJMenu_iOS7
//
//  Created by jack on 13-10-29.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"

typedef void(^SMSFeedback)(BOOL success);

@interface TSMS : TObject
@property (nonatomic, strong) SMSFeedback block_SMSFeedback;
- (void)setBlock_SMSFeedback:(SMSFeedback)block_SMSFeedback;

- (BOOL)canSendSMS;
- (void)showMessageWithContent:(NSString*)content from:(UIViewController*)controller;
@end
