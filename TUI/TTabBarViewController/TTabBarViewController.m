//
//  TTabBarViewController.m
//  cpblm
//
//  Created by jack on 13-11-2.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TTabBarViewController.h"
#import "TDevice.h"
#import "TUIManager.h"

#define tTabBarHeight 49.0f

@implementation UIViewController (TTabBarViewControllerSupport)

- (TTabBarViewController*)tTabBarController
{
    UIViewController *vc = self.parentViewController;
    while (vc) {
        if ([vc isKindOfClass:[TTabBarViewController class]]) {
            return (TTabBarViewController*)vc;
        } else if (vc.parentViewController && vc.parentViewController != vc) {
            vc = vc.parentViewController;
        } else {
            vc = nil;
        }
    }
    return nil;
}

@end

@interface TTabBarViewController ()

@end

@implementation TTabBarViewController
@synthesize tabBar = _tabBar;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize selectedIndex = _selectedIndex;
@synthesize tabBarHidden = _tabBarHidden;
@synthesize tabBarTransparent = _tabBarTransparent;
@synthesize tabBarBackgroundColor = _tabBarBackgroundColor;

@synthesize block_tabBarController_shouldSelectViewController = _block_tabBarController_shouldSelectViewController;
@synthesize block_tabBarController_didSelectViewController = _block_tabBarController_didSelectViewController;

#pragma mark -
#pragma mark lifecycle

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

- (id)initWithViewControllers:(NSArray *)vcs TTabBarItems:(NSArray *)items
{
    self = [super init];
	if (self != nil)
	{
        __weak TTabBarViewController* _self = self;
		_viewControllers = [NSMutableArray arrayWithArray:vcs];
		CGRect f;
        if([TDevice isIOS7])
        {
            f = [[UIScreen mainScreen] bounds];
        }
        else
        {
            f = [[UIScreen mainScreen] applicationFrame];
        }
		_containerView = [[UIView alloc] initWithFrame:f];
		
		_transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - tTabBarHeight)];
		_transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
		
		_tabBar = [[TTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - tTabBarHeight, 320.0f, tTabBarHeight) TTabBarItems:items];
        [_tabBar setBlock_tabBar_shouldSelectIndex:^BOOL(TTabBar *tabBar, NSInteger index) {
            if(_self.block_tabBarController_shouldSelectViewController)
            {
                return _self.block_tabBarController_shouldSelectViewController(_self, [_self.viewControllers objectAtIndex:index]);
            }
            return YES;
        }];
        
        [_tabBar setBlock_tabBar_didSelectIndex:^(TTabBar *tabBar, NSInteger index) {
            [_self displayViewAtIndex:index];
        }];
        
        
        
	}
	return self;
}

- (void)setTabBarBackgroundColor:(UIColor *)tabBarBackgroundColor
{
    _tabBarBackgroundColor = tabBarBackgroundColor;
    [_tabBar setBackgroundColor:_tabBarBackgroundColor];
}

- (void)loadView
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_containerView addSubview:_tabBar];
	self.view = _containerView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.selectedIndex = 0;
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	_tabBar = nil;
	_viewControllers = nil;
}

- (void)dealloc
{
    _tabBar = nil;
    _containerView = nil;
    _transitionView = nil;
    _viewControllers = nil;
}

#pragma mark - instant methods
- (TTabBar*)tabBar
{
	return _tabBar;
}

- (BOOL)tabBarTransparent
{
	return _tabBarTransparent;
}

- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - tTabBarHeight);
	}
}

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
{
    _tabBarHidden = yesOrNO;
	if (yesOrNO == YES) {
		if (self.tabBar.frame.origin.y == self.view.frame.size.height) {
			return;
		}
	} else {
		if (self.tabBar.frame.origin.y == self.view.frame.size.height - tTabBarHeight) {
			return;
		}
	}
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
    }
    float tabBarOriginY = tabBarOriginY = yesOrNO ? self.view.frame.size.height : self.view.frame.size.height - tTabBarHeight;
    self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, tabBarOriginY, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
    _transitionView.frame = CGRectMake(_transitionView.frame.origin.x, _transitionView.frame.origin.y, _transitionView.frame.size.width, tabBarOriginY);
    if (animated == YES)
	{
		[UIView commitAnimations];
	}
}

- (NSUInteger)selectedIndex
{
	return _selectedIndex;
}

- (UIViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    // Remove view from superview.
    [[(UIViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    // Remove tab from tabbar.
    [_tabBar removeTabAtIndex:index];
}

- (void)insertViewController:(UIViewController *)vc withTTabBarItem:(TTabBarItem *)item atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:vc atIndex:index];
    [_tabBar insertTabWithTTabBarItem:item atIndex:index];
}


#pragma mark - Private methods
- (void)displayViewAtIndex:(NSUInteger)index
{
    UIViewController *targetViewController = [self.viewControllers objectAtIndex:index];
    // If target index is equal to current index.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        if ([targetViewController isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)targetViewController popToRootViewControllerAnimated:YES];
        }
        return;
    }
    
    _selectedIndex = index;
    
	[_transitionView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
	targetViewController.view.frame = _transitionView.bounds;
    [self addChildViewController:targetViewController];
    [_transitionView addSubview:targetViewController.view];
    
    if(_block_tabBarController_didSelectViewController)
    {
        _block_tabBarController_didSelectViewController(self, targetViewController);
    }
}



@end
