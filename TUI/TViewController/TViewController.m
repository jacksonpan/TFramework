//
//  TViewController.m
//  t2u
//
//  Created by ren pan on 13-6-28.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TViewController.h"
#import "TUIManager.h"
#import "TDevice.h"
#import "TStoryboardSegue.h"
#import "TNavigationBackButton.h"
#import "TNavigationLeftButton.h"
#import "TNavigationRightButton.h"
#import "UINavigationController+Transition.h"

@interface TViewController ()
{
    NSString* nav_backItemText;
    UIBarButtonItem* nav_backItem;
    BOOL isInitFirstViewWillAppear;
    BOOL isInitFirstViewDidAppear;
}
@property (nonatomic, strong) viewNavigationButtonAction block_viewNavigationButtonActionLeft;
@property (nonatomic, strong) viewNavigationButtonAction block_viewNavigationButtonActionRight;
@end

@implementation TViewController
@synthesize tag = _tag;
@synthesize isTransitionHaveAnimate = _isTransitionHaveAnimate;
@synthesize block_viewGoBackCallback = _block_viewGoBackCallback;
@synthesize object_viewGoBackCallback = _object_viewGoBackCallback;
@synthesize lastViewController = _lastViewController;
@synthesize block_viewWillGoBack = _block_viewWillGoBack;

@synthesize block_viewNavigationButtonActionLeft = _block_viewNavigationButtonActionLeft;
@synthesize block_viewNavigationButtonActionRight = _block_viewNavigationButtonActionRight;

@synthesize isGoNext = _isGoNext;

@synthesize enableNavigationTransition = _enableNavigationTransition;

- (void)dealloc
{
    [self unregisterForKeyboardNotifications];
}

- (void)initUI
{

}

- (void)initFirstViewWillAppear
{
    
}

- (void)initFirstViewDidAppear
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    if(!isInitFirstViewWillAppear)
    {
        isInitFirstViewWillAppear = YES;
        [self initFirstViewWillAppear];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    if(!isInitFirstViewDidAppear)
    {
        isInitFirstViewDidAppear = YES;
        [self initFirstViewDidAppear];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _isTransitionHaveAnimate = YES;
    _isGoNext = NO;
    if(![TDevice isIOS7])
    {
        self.wantsFullScreenLayout = [[TUIManager current] wantsFullScreenLayout];
    }
    [self registerForKeyboardNotifications];
    [self initUI];
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

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification 
                                               object:nil];
}

- (void)unregisterForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)navLeftAction:(id)sender
{
    if(_block_viewNavigationButtonActionLeft)
    {
        _block_viewNavigationButtonActionLeft();
    }
}

- (void)addNavigationLeftButtonWithText:(NSString*)text block:(viewNavigationButtonAction)leftAction
{
    _block_viewNavigationButtonActionLeft = leftAction;
    if([TDevice isIOS7])
    {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(navLeftAction:)];
        [self.navigationItem setLeftBarButtonItem:item animated:NO];
    }
    else
    {
        TNavigationLeftButton* left = [[TNavigationLeftButton alloc] initWithFrame:CGRectZero];
        [left setText:text];
        [left addTarget:self action:@selector(navLeftAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:left] animated:NO];
    }
}

- (void)addNavigationLeftButtonWithImage:(UIImage*)image block:(viewNavigationButtonAction)leftAction
{
    _block_viewNavigationButtonActionLeft = leftAction;
    if([TDevice isIOS7])
    {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(navLeftAction:)];
        [self.navigationItem setLeftBarButtonItem:item animated:NO];
    }
    else
    {
        TNavigationLeftButton* left = [[TNavigationLeftButton alloc] initWithFrame:CGRectZero];
        [left setImage:image];
        [left addTarget:self action:@selector(navLeftAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:left] animated:NO];
    }
}

- (void)navRightAction:(id)sender
{
    if(_block_viewNavigationButtonActionRight)
    {
        _block_viewNavigationButtonActionRight();
    }
}

- (void)addNavigationRightButtonWithText:(NSString*)text block:(viewNavigationButtonAction)rightAction
{
    _block_viewNavigationButtonActionRight = rightAction;
    if([TDevice isIOS7])
    {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(navRightAction:)];
        [self.navigationItem setRightBarButtonItem:item animated:NO];
    }
    else
    {
        TNavigationRightButton* right = [[TNavigationRightButton alloc] initWithFrame:CGRectZero];
        [right setText:text];
        [right addTarget:self action:@selector(navRightAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:right] animated:NO];
    }
}

- (void)addNavigationRightButtonWithImage:(UIImage*)image block:(viewNavigationButtonAction)rightAction
{
    _block_viewNavigationButtonActionRight = rightAction;
    if([TDevice isIOS7])
    {
        UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(navRightAction:)];
        [self.navigationItem setRightBarButtonItem:item animated:NO];
    }
    else
    {
        TNavigationRightButton* right = [[TNavigationRightButton alloc] initWithFrame:CGRectZero];
        [right setImage:image];
        [right addTarget:self action:@selector(navRightAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:right] animated:NO];
    }
}

- (void)addNextViewBackBarButtonItemWithText:(NSString*)text
{
    nav_backItemText = text;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if(!_isGoNext)
    {
        ((TViewController*)_lastViewController).isGoNext = NO;
        if(_block_viewWillGoBack)
        {
            _block_viewWillGoBack();
        }
        if(_lastViewController && ((TViewController*)_lastViewController).block_viewGoBackCallback)
        {
            ((TViewController*)_lastViewController).block_viewGoBackCallback(_object_viewGoBackCallback);
        }
    }
}

- (void)popBack:(id)sender
{
    [self goBack:YES];
}

- (void)generateNavigationBarBackItem:(TViewController*)nextViewController
{
    if([TDevice isIOS7])
    {
        if(nav_backItemText == nil)
        {
            nav_backItemText = self.title;
        }
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nav_backItemText style:UIBarButtonItemStylePlain target:nextViewController action:nil];
    }
    else
    {
        TNavigationBackButton* left = [[TNavigationBackButton alloc] initWithFrame:CGRectZero];
        if(nav_backItemText == nil)
        {
            nav_backItemText = self.title;
        }
        [left setText:nav_backItemText];
        [left addTarget:nextViewController action:@selector(popBack:) forControlEvents:UIControlEventTouchUpInside];
        [nextViewController.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:left] animated:NO];
    }
}

- (void)goNext:(id)viewController animated:(BOOL)animated
{
    _isGoNext = YES;
    TViewController* v = viewController;
    v.lastViewController = self;
    [self generateNavigationBarBackItem:v];
    
    if(_enableNavigationTransition && animated)
    {
        [self.navigationController pushViewControllerWithNavigationControllerTransition:v];
    }
    else
    {
        [self.navigationController pushViewController:v animated:animated];
    }
}

- (void)goBack:(BOOL)animated
{
    if(_enableNavigationTransition && animated)
    {
        [self.navigationController popViewControllerWithNavigationControllerTransition];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:animated];
    }
}

- (void)goBackTo:(id)viewController animated:(BOOL)animated
{
    [self.navigationController popToViewController:viewController animated:animated];
}

- (id)findLast
{
    NSArray* viewControllers = self.navigationController.viewControllers;
    NSInteger index = [viewControllers indexOfObject:self];
    if(index == 0)
    {
        return nil;
    }
    return [viewControllers objectAtIndex:index-1];
}

- (id)findWithTag:(NSInteger)tag
{
    NSArray* viewControllers = self.navigationController.viewControllers;
    for(TViewController* s in viewControllers)
    {
        if(s.tag == tag)
        {
            return s;
        }
    }
    return nil;
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    
}

- (CGSize)keyboardSize:(NSNotification *)aNotification
{
    NSDictionary *info = [aNotification userInfo];
    NSValue *beginValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    NSLog(@"info:%@", info);
    //NSValue *endValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyboardSize;
    keyboardSize = [beginValue CGRectValue].size;
    
    return keyboardSize;
}

- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender animated:(BOOL)animated
{
    _isTransitionHaveAnimate = animated;
    [self performSegueWithIdentifier:identifier sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TStoryboardSegue* t = (TStoryboardSegue*)segue;
    t.isAnimate = _isTransitionHaveAnimate;
}



@end
