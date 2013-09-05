//
//  TViewController.h
//  t2u
//
//  Created by ren pan on 13-6-28.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TNibLoader.h"

typedef void(^viewGoBackCallback)(id object);

@interface TViewController : UIViewController
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) BOOL isTransitionHaveAnimate;
@property (nonatomic, strong) id object_viewGoBackCallback;//you must set value before goBack and goBackTo
@property (nonatomic, strong) viewGoBackCallback block_viewGoBackCallback;

- (void)setBlock_viewGoBackCallback:(viewGoBackCallback)block_viewGoBackCallback;

- (void)initUI;

- (void)goNext:(id)viewController animated:(BOOL)animated;
- (void)goBack:(BOOL)animated;
- (void)goBackTo:(id)viewController animated:(BOOL)animated;
- (id)findLast;
- (id)findWithTag:(NSInteger)tag;

- (CGSize)keyboardSize:(NSNotification *)aNotification;

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender animated:(BOOL)animated;
@end
