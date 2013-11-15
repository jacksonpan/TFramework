//
//  TTableViewController.h
//  VJMenu_iOS7
//
//  Created by jack on 13-9-28.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNibLoader.h"
#import "TViewController.h"

typedef void(^viewWillGoBack)();
typedef void(^viewGoBackCallback)(id object);
typedef void(^viewNavigationButtonAction)();

@interface TTableViewController : UITableViewController
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) BOOL isTransitionHaveAnimate;
@property (nonatomic, strong) id object_viewGoBackCallback;//you must set value before goBack and goBackTo
@property (nonatomic, strong) viewGoBackCallback block_viewGoBackCallback;
@property (nonatomic, strong) viewWillGoBack block_viewWillGoBack;

@property (nonatomic, assign) id lastViewController;

@property (nonatomic, assign) BOOL isGoNext;

- (void)setBlock_viewGoBackCallback:(viewGoBackCallback)block_viewGoBackCallback;
- (void)setBlock_viewWillGoBack:(viewWillGoBack)block_viewWillGoBack;

- (void)initUI;

- (void)goNext:(id)viewController animated:(BOOL)animated;
- (void)goBack:(BOOL)animated;
- (void)goBackTo:(id)viewController animated:(BOOL)animated;
- (id)findLast;
- (id)findWithTag:(NSInteger)tag;

- (CGSize)keyboardSize:(NSNotification *)aNotification;

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender animated:(BOOL)animated;

- (void)addNextViewBackBarButtonItemWithText:(NSString*)text;
- (void)addNavigationLeftButtonWithText:(NSString*)text block:(viewNavigationButtonAction)leftAction;
- (void)addNavigationLeftButtonWithImage:(UIImage*)image block:(viewNavigationButtonAction)leftAction;
- (void)addNavigationRightButtonWithText:(NSString*)text block:(viewNavigationButtonAction)rightAction;
- (void)addNavigationRightButtonWithImage:(UIImage*)image block:(viewNavigationButtonAction)rightAction;
@end
