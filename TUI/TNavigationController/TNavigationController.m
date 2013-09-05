//
//  TNavigationController.m
//  t2u
//
//  Created by ren pan on 13-6-28.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TNavigationController.h"
#import "TUIManager.h"

@interface TNavigationController ()

@end

@implementation TNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.wantsFullScreenLayout = [[TUIManager current] wantsFullScreenLayout];
    self.navigationBar.translucent = [[TUIManager current] navigationBarTranslucent];
    if(self.navigationBar.translucent)
    {
        [self.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return [[TUIManager current] isSupportAutorotate];
}
@end
