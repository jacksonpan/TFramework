//
//  TTabBarViewController.h
//  cpblm
//
//  Created by jack on 13-11-2.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TViewController.h"
#import "TTabBarItem.h"
#import "TTabBar.h"

@class TTabBarViewController;

typedef BOOL(^tabBarController_shouldSelectViewController)(TTabBarViewController* tabBarController, UIViewController* viewController);
typedef void(^tabBarController_didSelectViewController)(TTabBarViewController* tabBarController, UIViewController* viewController);

@interface TTabBarViewController : TViewController
{
	UIView      *_containerView;
	UIView		*_transitionView;
}

@property (nonatomic, strong) tabBarController_shouldSelectViewController block_tabBarController_shouldSelectViewController;
@property (nonatomic, strong) tabBarController_didSelectViewController block_tabBarController_didSelectViewController;

- (void)setBlock_tabBarController_shouldSelectViewController:(tabBarController_shouldSelectViewController)block_tabBarController_shouldSelectViewController;
- (void)setBlock_tabBarController_didSelectViewController:(tabBarController_didSelectViewController)block_tabBarController_didSelectViewController;

@property(nonatomic, copy) NSMutableArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;

// Apple is readonly
@property (nonatomic, readonly) TTabBar *tabBar;

// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic, readonly) BOOL tabBarHidden;
@property (nonatomic, strong) UIColor* tabBarBackgroundColor;

- (id)initWithViewControllers:(NSArray *)vcs TTabBarItems:(NSArray *)items;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController *)vc withTTabBarItem:(TTabBarItem *)item atIndex:(NSUInteger)index;
@end

@interface UIViewController (TTabBarViewControllerSupport)
@property(nonatomic, strong, readonly) TTabBarViewController *tTabBarController;
@end