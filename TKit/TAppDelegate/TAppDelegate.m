//
//  TAppDelegate.m
//  TFramework
//
//  Created by ren pan on 13-8-10.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TAppDelegate.h"

@interface TAppDelegate ()
{
    
}
@end

@implementation TAppDelegate

+ (id)sharedAppDelegate
{
    id delegate = [[UIApplication sharedApplication] delegate];
    return delegate;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        [self initAppDelegate];
    }
    return self;
}

- (void)initAppDelegate
{
    
}

@synthesize blockapplicationDidFinishLaunching = _blockapplicationDidFinishLaunching;
@synthesize blockwillFinishLaunchingWithOptions = _blockwillFinishLaunchingWithOptions;
@synthesize blockdidFinishLaunchingWithOptions = _blockdidFinishLaunchingWithOptions;
@synthesize blockapplicationDidBecomeActive = _blockapplicationDidBecomeActive;
@synthesize blockapplicationWillResignActive = _blockapplicationWillResignActive;
@synthesize blockopenURL = _blockopenURL;
@synthesize blockapplicationDidReceiveMemoryWarning = _blockapplicationDidReceiveMemoryWarning;
@synthesize blockapplicationWillTerminate = _blockapplicationWillTerminate;
@synthesize blockapplicationSignificantTimeChange = _blockapplicationSignificantTimeChange;
@synthesize blockwillChangeStatusBarOrientation = _blockwillChangeStatusBarOrientation;
@synthesize blockdidChangeStatusBarOrientation = _blockdidChangeStatusBarOrientation;
@synthesize blockwillChangeStatusBarFrame = _blockwillChangeStatusBarFrame;
@synthesize blockdidChangeStatusBarFrame = _blockdidChangeStatusBarFrame;
@synthesize blockdidRegisterForRemoteNotificationsWithDeviceToken = _blockdidRegisterForRemoteNotificationsWithDeviceToken;
@synthesize blockdidFailToRegisterForRemoteNotificationsWithError = _blockdidFailToRegisterForRemoteNotificationsWithError;
@synthesize blockdidReceiveRemoteNotification = _blockdidReceiveRemoteNotification;
@synthesize blockdidReceiveLocalNotification = _blockdidReceiveLocalNotification;
@synthesize blockapplicationDidEnterBackground = _blockapplicationDidEnterBackground;
@synthesize blockapplicationWillEnterForeground = _blockapplicationWillEnterForeground;
@synthesize blockapplicationProtectedDataWillBecomeUnavailable = _blockapplicationProtectedDataWillBecomeUnavailable;
@synthesize blockapplicationProtectedDataDidBecomeAvailable = _blockapplicationProtectedDataDidBecomeAvailable;
@synthesize blocksupportedInterfaceOrientationsForWindow = _blocksupportedInterfaceOrientationsForWindow;
@synthesize blockviewControllerWithRestorationIdentifierPath = _blockviewControllerWithRestorationIdentifierPath;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    if(_blockapplicationDidFinishLaunching)
    {
        _blockapplicationDidFinishLaunching(application);
    }
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0)
{
    if(_blockwillFinishLaunchingWithOptions)
    {
        return _blockwillFinishLaunchingWithOptions(application, launchOptions);
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0)
{
    if(_blockdidFinishLaunchingWithOptions)
    {
        return _blockdidFinishLaunchingWithOptions(application, launchOptions);
    }
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if(_blockapplicationDidBecomeActive)
    {
        return _blockapplicationDidBecomeActive(application);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    if(_blockapplicationWillResignActive)
    {
        return _blockapplicationWillResignActive(application);
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation NS_AVAILABLE_IOS(4_2)
{
    if(_blockopenURL)
    {
        return _blockopenURL(application, url, sourceApplication, annotation);
    }
    return YES;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    if(_blockapplicationDidReceiveMemoryWarning)
    {
        _blockapplicationDidReceiveMemoryWarning(application);
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    if(_blockapplicationWillTerminate)
    {
        _blockapplicationWillTerminate(application);
    }
}

- (void)applicationSignificantTimeChange:(UIApplication *)application
{
    if(_blockapplicationSignificantTimeChange)
    {
        _blockapplicationSignificantTimeChange(application);
    }
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration
{
    if(_blockwillChangeStatusBarOrientation)
    {
        _blockwillChangeStatusBarOrientation(application, newStatusBarOrientation, duration);
    }
}

- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation
{
    if(_blockdidChangeStatusBarOrientation)
    {
        _blockdidChangeStatusBarOrientation(application, oldStatusBarOrientation);
    }
}

- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame
{
    if(_blockwillChangeStatusBarFrame)
    {
        _blockwillChangeStatusBarFrame(application, newStatusBarFrame);
    }
}

- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame
{
    if(_blockdidChangeStatusBarFrame)
    {
        _blockdidChangeStatusBarFrame(application, oldStatusBarFrame);
    }
}

// one of these will be called after calling -registerForRemoteNotifications
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0)
{
    if(_blockdidRegisterForRemoteNotificationsWithDeviceToken)
    {
        _blockdidRegisterForRemoteNotificationsWithDeviceToken(application, deviceToken);
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0)
{
    if(_blockdidFailToRegisterForRemoteNotificationsWithError)
    {
        _blockdidFailToRegisterForRemoteNotificationsWithError(application, error);
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0)
{
    if(_blockdidReceiveRemoteNotification)
    {
        _blockdidReceiveRemoteNotification(application, userInfo);
    }
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0)
{
    if(_blockdidReceiveLocalNotification)
    {
        _blockdidReceiveLocalNotification(application, notification);
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    if(_blockapplicationDidEnterBackground)
    {
        _blockapplicationDidEnterBackground(application);
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    if(_blockapplicationWillEnterForeground)
    {
        _blockapplicationWillEnterForeground(application);
    }
}


- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    if(_blockapplicationProtectedDataWillBecomeUnavailable)
    {
        _blockapplicationProtectedDataWillBecomeUnavailable(application);
    }
}

- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application    NS_AVAILABLE_IOS(4_0)
{
    if(_blockapplicationProtectedDataDidBecomeAvailable)
    {
        _blockapplicationProtectedDataDidBecomeAvailable(application);
    }
}

/*
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window  NS_AVAILABLE_IOS(6_0)
{
    if(_blocksupportedInterfaceOrientationsForWindow)
    {
        return _blocksupportedInterfaceOrientationsForWindow(application, window);
    }
    return 0;
}
 */

#pragma mark -- State Restoration protocol adopted by UIApplication delegate --
/*
- (UIViewController *) application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0)
{
    if(_blockviewControllerWithRestorationIdentifierPath)
    {
        return _blockviewControllerWithRestorationIdentifierPath(application, identifierComponents, coder);
    }
    return nil;
}
 */
/*
- (BOOL) application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
- (BOOL) application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
- (void) application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
- (void) application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
 */
@end
