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
- (void)showAlertTipWithContent:(NSString*)content button:(id)button block:(buttonCallback)block;
@end
