//
//  TWeChatV2.h
//  VJMenu_iOS7
//
//  Created by jack on 13-10-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"
#import "WXApi.h"

#define TWeChat             TWeChatV2

typedef enum _ENUM_TWECHAT_SCENE
{
    ENUM_TWECHAT_SCENE_SESSION = WXSceneSession,
    ENUM_TWECHAT_SCENE_TIMELINE = WXSceneTimeline,
    ENUM_TWECHAT_SCENE_FAVOURITE = WXSceneFavorite
}ENUM_TWECHAT_SCENE;

typedef void(^blockGetMessageFromWXReq)(void);//the bottom if you want send info to WeChat, please do the action 'sendResponse'
typedef void(^blockShowMessageFromWXReq)(WXMediaMessage* message);
typedef void(^blockLaunchFromWXReq)(void);
typedef void(^blockSendMessageToWXResp)(NSInteger errCode);

@interface TWeChatV2 : TObject
@property (nonatomic, assign) BOOL OpenFromWeChat;
@property (nonatomic, assign) ENUM_TWECHAT_SCENE scene;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (void)registerWeChatWithAppID:(NSString*)appid;
- (BOOL)isWeChatInstalled;
- (NSString*)getWeChatAppStoreURL;
- (BOOL)openWeChat;

@property (nonatomic, strong) blockGetMessageFromWXReq bGetMessageFromWXReq;
@property (nonatomic, strong) blockShowMessageFromWXReq bShowMessageFromWXReq;
@property (nonatomic, strong) blockLaunchFromWXReq bLaunchFromWXReq;
@property (nonatomic, strong) blockSendMessageToWXResp bSendMessageToWXResp;

- (void)setBGetMessageFromWXReq:(blockGetMessageFromWXReq)bGetMessageFromWXReq;
- (void)setBShowMessageFromWXReq:(blockShowMessageFromWXReq)bShowMessageFromWXReq;
- (void)setBLaunchFromWXReq:(blockLaunchFromWXReq)bLaunchFromWXReq;
- (void)setBSendMessageToWXResp:(blockSendMessageToWXResp)bSendMessageToWXResp;

- (void)sendRequest:(BaseReq*)req;
- (void)sendResponse:(BaseResp*)resp;

- (void)sendToWithText:(NSString*)text;
- (void)sendBackWithText:(NSString*)text;

- (void)sendToWithURL:(NSString*)webURL title:(NSString*)title desc:(NSString*)desc thumb:(UIImage*)thumb;
- (void)sendBackWithURL:(NSString*)webURL title:(NSString*)title desc:(NSString*)desc thumb:(UIImage*)thumb;

- (void)sendToWithImageData:(NSData*)imageData thumb:(UIImage*)thumb;
- (void)sendBackWithImageData:(NSData*)imageData thumb:(UIImage*)thumb;
@end
