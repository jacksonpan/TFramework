//
//  TWeChatV2.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TWeChatV2.h"

@interface TWeChatV2 () <WXApiDelegate>

@end

@implementation TWeChatV2
ShareInstanceDefine

@synthesize OpenFromWeChat = _OpenFromWeChat;
@synthesize scene = _scene;
@synthesize bGetMessageFromWXReq = _bGetMessageFromWXReq;
@synthesize bShowMessageFromWXReq = _bShowMessageFromWXReq;
@synthesize bLaunchFromWXReq = _bLaunchFromWXReq;
@synthesize bSendMessageToWXResp = _bSendMessageToWXResp;

- (void)_init
{
    _scene = ENUM_TWECHAT_SCENE_SESSION;
    _OpenFromWeChat = NO;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (void)registerWeChatWithAppID:(NSString*)appid
{
    [WXApi registerApp:appid];
}

- (BOOL)isWeChatInstalled
{
    return [WXApi isWXAppInstalled];
}

- (NSString*)getWeChatAppStoreURL
{
    return [WXApi getWXAppInstallUrl];
}

- (BOOL)openWeChat
{
    return [WXApi openWXApp];
}

- (void)onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        _OpenFromWeChat = YES;
        if(_bGetMessageFromWXReq)
        {
            _bGetMessageFromWXReq();
        }
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        if(_bShowMessageFromWXReq)
        {
            _bShowMessageFromWXReq(msg);
        }
        /*
        //显示微信传过来的内容
        WXAppExtendObject *obj = msg.mediaObject;
        
        NSString *strTitle = [NSString stringWithFormat:@"微信请求App显示内容"];
        NSString *strMsg = [NSString stringWithFormat:@"标题：%@ \n内容：%@ \n附带信息：%@ \n缩略图:%u bytes\n\n", msg.title, msg.description, obj.extInfo, msg.thumbData.length];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
         */
    }
    else if([req isKindOfClass:[LaunchFromWXReq class]])
    {
        if(_bLaunchFromWXReq)
        {
            _bLaunchFromWXReq();
        }
    }
}

- (void)onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        if(_bSendMessageToWXResp)
        {
            _bSendMessageToWXResp(resp.errCode);
        }
    }
}

- (void)sendRequest:(BaseReq*)req
{
    [WXApi sendReq:req];
}

- (void)sendResponse:(BaseResp*)resp
{
    [WXApi sendResp:resp];
}

- (void)sendToWithText:(NSString*)text
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.text = text;
    req.bText = YES;
    req.scene = _scene;
    [self sendRequest:req];
}

- (void)sendBackWithText:(NSString*)text
{
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.text = text;
    resp.bText = YES;
    
    [self sendResponse:resp];
}

- (void)sendToWithURL:(NSString*)webURL title:(NSString*)title desc:(NSString*)desc thumb:(UIImage*)thumb
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = desc;
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = webURL;
    message.mediaObject = ext;
    if(thumb)
    {
        [message setThumbImage:thumb];
    }
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [self sendRequest:req];
}

- (void)sendBackWithURL:(NSString*)webURL title:(NSString*)title desc:(NSString*)desc thumb:(UIImage*)thumb
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = desc;
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = webURL;
    message.mediaObject = ext;
    if(thumb)
    {
        [message setThumbImage:thumb];
    }
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    
    [self sendResponse:resp];
}

- (void)sendToWithImageData:(NSData*)imageData thumb:(UIImage*)thumb
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:thumb];
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = imageData;
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = _scene;
    
    [self sendRequest:req];
}

- (void)sendBackWithImageData:(NSData*)imageData thumb:(UIImage*)thumb
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:thumb];
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = imageData;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    
    [self sendResponse:resp];
}

@end
