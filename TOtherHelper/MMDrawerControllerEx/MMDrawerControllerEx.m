//
//  MMDrawerControllerEx.m
//  vjmenu
//
//  Created by ren pan on 13-9-7.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "MMDrawerControllerEx.h"
#import "TUIManager.h"
#import "TDevice.h"
#import "MMDrawerController+Subclass.h"

@interface MMDrawerControllerEx ()
@property (nonatomic, strong) NSMutableArray* receivedTouchCallbackArray;
@end

@implementation MMDrawerControllerEx
@synthesize receivedTouchCallbackArray = _receivedTouchCallbackArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(![TDevice isIOS7])
    {
        self.wantsFullScreenLayout = [[TUIManager current] wantsFullScreenLayout];
    }
    
    if(_receivedTouchCallbackArray == nil)
    {
        _receivedTouchCallbackArray = [NSMutableArray new];
    }
}

- (void)addTouchCallback:(shouldReceiveGestureTouch)block
{
    if(block)
    {
        [_receivedTouchCallbackArray addObject:block];
    }
}

- (void)removeTouchCallback:(shouldReceiveGestureTouch)block
{
    if(block)
    {
        [_receivedTouchCallbackArray removeObject:block];
    }
}

- (BOOL)shouldAutorotate
{
    return [[TUIManager current] isSupportAutorotate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if(![[TUIManager current] isSupportAutorotate])
    {
        return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    BOOL shouldReceiveTouch = [super gestureRecognizer:gestureRecognizer shouldReceiveTouch:touch];
    if(shouldReceiveTouch)
    {
        for(shouldReceiveGestureTouch block in _receivedTouchCallbackArray)
        {
            if(block)
            {
                block();
            }
        }
    }
    return shouldReceiveTouch;
}
@end
