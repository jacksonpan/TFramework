//
//  TAppDelegateProtocol.h
//  TFramework
//
//  Created by ren pan on 13-8-11.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^applicationDidFinishLaunching)(UIApplication* application);
typedef BOOL(^willFinishLaunchingWithOptions)(UIApplication* application, NSDictionary* launchOptions) NS_AVAILABLE_IOS(6_0);
typedef BOOL(^didFinishLaunchingWithOptions)(UIApplication* application, NSDictionary* launchOptions) NS_AVAILABLE_IOS(3_0);
typedef void(^applicationDidBecomeActive)(UIApplication* application);
typedef void(^applicationWillResignActive)(UIApplication* application);
typedef BOOL(^openURL)(UIApplication* application, NSURL* url, NSString* sourceApplication, id annotation);
typedef void(^applicationDidReceiveMemoryWarning)(UIApplication* application);
typedef void(^applicationWillTerminate)(UIApplication* application);
typedef void(^applicationSignificantTimeChange)(UIApplication* application);
typedef void(^willChangeStatusBarOrientation)(UIApplication* application, UIInterfaceOrientation newStatusBarOrientation, NSTimeInterval duration);
typedef void(^didChangeStatusBarOrientation)(UIApplication* application, UIInterfaceOrientation oldStatusBarOrientation);
typedef void(^willChangeStatusBarFrame)(UIApplication* application, CGRect newStatusBarFrame);
typedef void(^didChangeStatusBarFrame)(UIApplication* application, CGRect oldStatusBarFrame);;
typedef void(^didRegisterForRemoteNotificationsWithDeviceToken)(UIApplication* application, NSData* deviceToken) NS_AVAILABLE_IOS(3_0);
typedef void(^didFailToRegisterForRemoteNotificationsWithError)(UIApplication* application, NSError* error) NS_AVAILABLE_IOS(3_0);
typedef void(^didReceiveRemoteNotification)(UIApplication* application, NSDictionary* userInfo) NS_AVAILABLE_IOS(3_0);
typedef void(^didReceiveLocalNotification)(UIApplication* application, UILocalNotification* notification) NS_AVAILABLE_IOS(4_0);
typedef void(^applicationDidEnterBackground)(UIApplication* application) NS_AVAILABLE_IOS(4_0);
typedef void(^applicationWillEnterForeground)(UIApplication* application) NS_AVAILABLE_IOS(4_0);
typedef void(^applicationProtectedDataWillBecomeUnavailable)(UIApplication* application) NS_AVAILABLE_IOS(4_0);
typedef void(^applicationProtectedDataDidBecomeAvailable)(UIApplication* application) NS_AVAILABLE_IOS(4_0);
typedef NSUInteger(^supportedInterfaceOrientationsForWindow)(UIApplication* application, UIWindow* window) NS_AVAILABLE_IOS(6_0);
typedef UIViewController*(^viewControllerWithRestorationIdentifierPath)(UIApplication* application, NSArray* identifierComponents, NSCoder* coder) NS_AVAILABLE_IOS(6_0);