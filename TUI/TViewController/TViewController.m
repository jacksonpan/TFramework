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


@interface TViewController ()

@end

@implementation TViewController
@synthesize tag = _tag;
@synthesize isTransitionHaveAnimate = _isTransitionHaveAnimate;
@synthesize block_viewGoBackCallback = _block_viewGoBackCallback;
@synthesize object_viewGoBackCallback = _object_viewGoBackCallback;

- (void)dealloc
{
    [self unregisterForKeyboardNotifications];
}

- (void)initUI
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _isTransitionHaveAnimate = YES;
    
    self.wantsFullScreenLayout = [[TUIManager current] wantsFullScreenLayout];
    
    [self initUI];
    
    [self registerForKeyboardNotifications];
}

- (BOOL)shouldAutorotate
{
    return [[TUIManager current] isSupportAutorotate];
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

- (void)goNext:(id)viewController animated:(BOOL)animated
{
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)goBack:(BOOL)animated
{
    [self.navigationController popViewControllerAnimated:animated];
    if(_block_viewGoBackCallback)
    {
        _block_viewGoBackCallback(_object_viewGoBackCallback);
    }
}

- (void)goBackTo:(id)viewController animated:(BOOL)animated
{
    [self.navigationController popToViewController:viewController animated:animated];
    if(_block_viewGoBackCallback)
    {
        _block_viewGoBackCallback(_object_viewGoBackCallback);
    }
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
