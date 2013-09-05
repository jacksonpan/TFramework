//
//  TAppDelegate.h
//  TFramework
//
//  Created by ren pan on 13-8-10.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAppDelegateProtocol.h"

@interface TAppDelegate : UIResponder <UIApplicationDelegate>
//here is need to use
@property (strong, nonatomic) UIWindow *window;
+ (id)sharedAppDelegate;
- (void)initAppDelegate;//main entry overwrite it

//need to set value
@property (nonatomic, strong) applicationDidFinishLaunching blockapplicationDidFinishLaunching;
@property (nonatomic, strong) willFinishLaunchingWithOptions blockwillFinishLaunchingWithOptions;
@property (nonatomic, strong) didFinishLaunchingWithOptions blockdidFinishLaunchingWithOptions;
@property (nonatomic, strong) applicationDidBecomeActive blockapplicationDidBecomeActive;
@property (nonatomic, strong) applicationWillResignActive blockapplicationWillResignActive;
@property (nonatomic, strong) openURL blockopenURL;
@property (nonatomic, strong) applicationDidReceiveMemoryWarning blockapplicationDidReceiveMemoryWarning;
@property (nonatomic, strong) applicationWillTerminate blockapplicationWillTerminate;
@property (nonatomic, strong) applicationSignificantTimeChange blockapplicationSignificantTimeChange;
@property (nonatomic, strong) willChangeStatusBarOrientation blockwillChangeStatusBarOrientation;
@property (nonatomic, strong) didChangeStatusBarOrientation blockdidChangeStatusBarOrientation;
@property (nonatomic, strong) willChangeStatusBarFrame blockwillChangeStatusBarFrame;
@property (nonatomic, strong) didChangeStatusBarFrame blockdidChangeStatusBarFrame;
@property (nonatomic, strong) didRegisterForRemoteNotificationsWithDeviceToken blockdidRegisterForRemoteNotificationsWithDeviceToken;
@property (nonatomic, strong) didFailToRegisterForRemoteNotificationsWithError blockdidFailToRegisterForRemoteNotificationsWithError;
@property (nonatomic, strong) didReceiveRemoteNotification blockdidReceiveRemoteNotification;
@property (nonatomic, strong) didReceiveLocalNotification blockdidReceiveLocalNotification;
@property (nonatomic, strong) applicationDidEnterBackground blockapplicationDidEnterBackground;
@property (nonatomic, strong) applicationWillEnterForeground blockapplicationWillEnterForeground;
@property (nonatomic, strong) applicationProtectedDataWillBecomeUnavailable blockapplicationProtectedDataWillBecomeUnavailable;
@property (nonatomic, strong) applicationProtectedDataDidBecomeAvailable blockapplicationProtectedDataDidBecomeAvailable;
@property (nonatomic, strong) supportedInterfaceOrientationsForWindow blocksupportedInterfaceOrientationsForWindow;
@property (nonatomic, strong) viewControllerWithRestorationIdentifierPath blockviewControllerWithRestorationIdentifierPath;

- (void)setBlockapplicationDidFinishLaunching:(applicationDidFinishLaunching)blockapplicationDidFinishLaunching;
- (void)setBlockwillFinishLaunchingWithOptions:(willFinishLaunchingWithOptions)blockwillFinishLaunchingWithOptions;
- (void)setBlockdidFinishLaunchingWithOptions:(didFinishLaunchingWithOptions)blockdidFinishLaunchingWithOptions;
- (void)setBlockapplicationDidBecomeActive:(applicationDidBecomeActive)blockapplicationDidBecomeActive;
- (void)setBlockapplicationWillResignActive:(applicationWillResignActive)blockapplicationWillResignActive;
- (void)setBlockopenURL:(openURL)blockopenURL;
- (void)setBlockapplicationDidReceiveMemoryWarning:(applicationDidReceiveMemoryWarning)blockapplicationDidReceiveMemoryWarning;
- (void)setBlockapplicationWillTerminate:(applicationWillTerminate)blockapplicationWillTerminate;
- (void)setBlockapplicationSignificantTimeChange:(applicationSignificantTimeChange)blockapplicationSignificantTimeChange;
- (void)setBlockwillChangeStatusBarOrientation:(willChangeStatusBarOrientation)blockwillChangeStatusBarOrientation;
- (void)setBlockdidChangeStatusBarOrientation:(didChangeStatusBarOrientation)blockdidChangeStatusBarOrientation;
- (void)setBlockwillChangeStatusBarFrame:(willChangeStatusBarFrame)blockwillChangeStatusBarFrame;
- (void)setBlockdidChangeStatusBarFrame:(didChangeStatusBarFrame)blockdidChangeStatusBarFrame;
- (void)setBlockdidRegisterForRemoteNotificationsWithDeviceToken:(didRegisterForRemoteNotificationsWithDeviceToken)blockdidRegisterForRemoteNotificationsWithDeviceToken;
- (void)setBlockdidFailToRegisterForRemoteNotificationsWithError:(didFailToRegisterForRemoteNotificationsWithError)blockdidFailToRegisterForRemoteNotificationsWithError;
- (void)setBlockdidReceiveRemoteNotification:(didReceiveRemoteNotification)blockdidReceiveRemoteNotification;
- (void)setBlockdidReceiveLocalNotification:(didReceiveLocalNotification)blockdidReceiveLocalNotification;
- (void)setBlockapplicationDidEnterBackground:(applicationDidEnterBackground)blockapplicationDidEnterBackground;
- (void)setBlockapplicationWillEnterForeground:(applicationWillEnterForeground)blockapplicationWillEnterForeground;
- (void)setBlockapplicationProtectedDataWillBecomeUnavailable:(applicationProtectedDataWillBecomeUnavailable)blockapplicationProtectedDataWillBecomeUnavailable;
- (void)setBlockapplicationProtectedDataDidBecomeAvailable:(applicationProtectedDataDidBecomeAvailable)blockapplicationProtectedDataDidBecomeAvailable;
- (void)setBlocksupportedInterfaceOrientationsForWindow:(supportedInterfaceOrientationsForWindow)blocksupportedInterfaceOrientationsForWindow;
- (void)setBlockviewControllerWithRestorationIdentifierPath:(viewControllerWithRestorationIdentifierPath)blockviewControllerWithRestorationIdentifierPath;
@end
