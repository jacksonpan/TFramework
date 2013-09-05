//
//  TTableViewController.h
//  vjmenu
//
//  Created by ren pan on 13-9-4.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTableViewController : UITableViewController
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) BOOL isTransitionHaveAnimate;
- (void)initUI;

- (void)goNext:(id)viewController animated:(BOOL)animated;
- (void)goBack:(BOOL)animated;
- (void)goBackTo:(id)viewController animated:(BOOL)animated;
- (id)findLast;
- (id)findWithTag:(NSInteger)tag;

- (CGSize)keyboardSize:(NSNotification *)aNotification;

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender animated:(BOOL)animated;
@end
