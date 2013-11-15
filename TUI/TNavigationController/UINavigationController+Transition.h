//
//  UINavigationController+Transition.h
//  cpblm
//
//  Created by jack on 13-11-14.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Transition)
- (void)pushViewControllerWithNavigationControllerTransition:(UIViewController *)viewController;
- (void)popViewControllerWithNavigationControllerTransition;
@end
