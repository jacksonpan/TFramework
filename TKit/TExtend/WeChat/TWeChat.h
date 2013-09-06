//
//  TWeChat.h
//  t2u
//
//  Created by ren pan on 13-7-16.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"
#import "WXApi.h"

typedef enum _ENUM_TWECHAT_SCENE
{
    ENUM_TWECHAT_SCENE_SESSION = WXSceneSession,
    ENUM_TWECHAT_SCENE_TIMELINE = WXSceneTimeline
}ENUM_TWECHAT_SCENE;

@class TWeChat;

typedef void(^requestMessageToSendWeChat)(TWeChat* wechat);
typedef void(^showMediaMessageFromWeChat)(WXAppExtendObject* extendObject);
typedef void(^sendMessageResponseFromWeChat)(BOOL success, int errCode, NSString *errStr, int type);
typedef void(^sendAuthResponseFromWeChat)(BOOL success, int errCode, NSString *errStr, int type);

@interface TWeChat : TObject
@property (nonatomic, assign) BOOL OpenFromWeChat;
@property (nonatomic, strong) requestMessageToSendWeChat blockRequestMessageToSendWeChat;
@property (nonatomic, strong) showMediaMessageFromWeChat blockShowMediaMessageFromWeChat;
@property (nonatomic, strong) sendMessageResponseFromWeChat blockSendMessageResponseFromWeChat;
@property (nonatomic, strong) sendAuthResponseFromWeChat blockSendAuthResponseFromWeChat;

- (void)setBlockRequestMessageToSendWeChat:(requestMessageToSendWeChat)blockRequestMessageToSendWeChat;
- (void)setBlockShowMediaMessageFromWeChat:(showMediaMessageFromWeChat)blockShowMediaMessageFromWeChat;
- (void)setBlockSendMessageResponseFromWeChat:(sendMessageResponseFromWeChat)blockSendMessageResponseFromWeChat;
- (void)setBlockSendAuthResponseFromWeChat:(sendAuthResponseFromWeChat)blockSendAuthResponseFromWeChat;

@property (nonatomic, assign) ENUM_TWECHAT_SCENE scene;

//for init
- (void)registerWeChatWithAppID:(NSString*)appid;
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (BOOL)isWeChatInstalled;
- (NSString*)getWeChatAppStoreURL;
- (BOOL)openWeChat;

- (void)sendTextToWeChat:(NSString*)text scene:(ENUM_TWECHAT_SCENE)scene;
- (void)sendTextToWeChat:(NSString*)text;
- (void)sendTextFromWeChat:(NSString*)text;

- (void)sendAppContentToWeChat:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage extInfo:(NSString*)extInfo url:(NSString*)url fileData:(NSData*)fileData scene:(ENUM_TWECHAT_SCENE)scene;
- (void)sendAppContentToWeChat:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage extInfo:(NSString*)extInfo url:(NSString*)url fileData:(NSData*)fileData;
- (void)sendAppContentBackToWeChat:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage extInfo:(NSString*)extInfo url:(NSString*)url fileData:(NSData*)fileData;

- (void)sendImageToWeChat:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL thumbImage:(UIImage*)thumbImage image:(UIImage*)image scene:(ENUM_TWECHAT_SCENE)scene;
- (void)sendImageToWeChat:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL thumbImage:(UIImage*)thumbImage image:(UIImage*)image;
- (void)sendImageBackToWeChat:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL thumbImage:(UIImage*)thumbImage image:(UIImage*)image;

- (void)sendNewsToWeChat:(NSString*)title description:(NSString*)description thumbImage:thumbImage webPageURL:(NSString*)webPageURL scene:(ENUM_TWECHAT_SCENE)scene;
- (void)sendNewsToWeChat:(NSString*)title description:(NSString*)description thumbImage:thumbImage webPageURL:(NSString*)webPageURL;
- (void)sendNewsBackToWeChat:(NSString*)title description:(NSString*)description thumbImage:thumbImage webPageURL:(NSString*)webPageURL;
@end
