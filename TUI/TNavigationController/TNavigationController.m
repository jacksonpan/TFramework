//
//  TNavigationController.m
//  t2u
//
//  Created by ren pan on 13-6-28.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TNavigationController.h"
#import "TUIManager.h"
#import "TDevice.h"
#import "TNavigationBar.h"
#import "TToolbar.h"

@interface TNavigationController ()

@end

@implementation TNavigationController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    UIStatusBarStyle style;
    TUIManager* ui = [TUIManager current];
    if(ui.navbar_style == 0)
    {
        style = UIStatusBarStyleDefault;
    }
    else
    {
        style = UIStatusBarStyleLightContent;
    }
    return style;
}

- (id)init
{
    self = [super initWithNavigationBarClass:[TNavigationBar class] toolbarClass:[TToolbar class]];
    if(self)
    {
        // Custom initialization here, if needed.
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithNavigationBarClass:[TNavigationBar class] toolbarClass:[TToolbar class]];
    if (self)
    {
        self.viewControllers = @[rootViewController];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(![TDevice isIOS7])
    {
        self.wantsFullScreenLayout = [[TUIManager current] wantsFullScreenLayout];
    }
    
    TUIManager* ui = [TUIManager current];
    TNavigationBar* navBar = (TNavigationBar*)self.navigationBar;
    navBar.overrideOpacity = NO;
    navBar.translucent = ui.navbar_translucent;
    navBar.tintColor = ui.navbar_TintColor;
    [navBar setTitleColor:ui.navbar_titleColor];
    if([TDevice isIOS7])
    {
        [navBar setTBarTintColor:ui.navbar_bgColor_iOS7];
    }
    else
    {
        [navBar setTBarTintColor:ui.navbar_bgColor];
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
