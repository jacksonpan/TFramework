//
//  MMDrawerControllerEx.h
//  vjmenu
//
//  Created by ren pan on 13-9-7.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "MMDrawerController.h"

typedef void(^shouldReceiveGestureTouch)(void);

@interface MMDrawerControllerEx : MMDrawerController
- (void)addTouchCallback:(shouldReceiveGestureTouch)block;
- (void)removeTouchCallback:(shouldReceiveGestureTouch)block;
@end
