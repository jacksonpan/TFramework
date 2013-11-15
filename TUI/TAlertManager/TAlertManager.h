//
//  TAlertManager.h
//  vjmenu
//
//  Created by ren pan on 13-8-30.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

typedef void(^buttonCallback)(NSInteger index);

@interface TAlertManager : TObject
- (void)showAlertWithTitle:(NSString*)title content:(NSString*)content button:(id)button block:(buttonCallback)block;
- (void)showTipWithContent:(NSString*)content button:(id)button block:(buttonCallback)block;

- (void)showAlertWithContent:(NSString*)content button:(id)button block:(buttonCallback)block;
- (void)showWaitWithTitle:(NSString*)title;
- (void)showProgressWithTitle:(NSString*)title progress:(CGFloat)progress;
- (void)hideCurrentHUD;
- (void)showToastWithSuccessContent:(NSString*)content;
- (void)showToastWithFailContent:(NSString*)content;
@end
