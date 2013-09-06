//
//  TWeChat.m
//  t2u
//
//  Created by ren pan on 13-7-16.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TWeChat.h"

#define FILE_DATA_BUFFER_SIZE       1024 * 100

@interface TWeChat () <WXApiDelegate>

@end

@implementation TWeChat
@synthesize OpenFromWeChat = _OpenFromWeChat;
@synthesize blockRequestMessageToSendWeChat = _blockRequestMessageToSendWeChat;
@synthesize blockShowMediaMessageFromWeChat = _blockShowMediaMessageFromWeChat;
@synthesize blockSendMessageResponseFromWeChat = _blockSendMessageResponseFromWeChat;
@synthesize blockSendAuthResponseFromWeChat = _blockSendAuthResponseFromWeChat;

@synthesize scene = _scene;

ShareInstanceDefine

- (void)_init
{
    _scene = ENUM_TWECHAT_SCENE_SESSION;
    self.OpenFromWeChat = NO;
}

- (void)registerWeChatWithAppID:(NSString*)appid
{
    [WXApi registerApp:appid];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [WXApi handleOpenURL:url delegate:self];
}

- (void)onReq:(BaseReq*)req
{
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        [self onRequestAppMessage];
    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        [self onShowMediaMessage:temp.message];
    }
}

- (void)onResp:(BaseResp*)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        if(_blockSendMessageResponseFromWeChat)
        {
            BOOL success = NO;
            if(resp.errCode == WXSuccess)
            {
                success = YES;
            }
            _blockSendMessageResponseFromWeChat(success, resp.errCode, resp.errStr, resp.type);
        }
    }
    else if([resp isKindOfClass:[SendAuthResp class]])
    {
        if(_blockSendAuthResponseFromWeChat)
        {
            BOOL success = NO;
            if(resp.errCode == WXSuccess)
            {
                success = YES;
            }
            _blockSendAuthResponseFromWeChat(success, resp.errCode, resp.errStr, resp.type);
        }
    }
}

- (void)onRequestAppMessage
{
    self.OpenFromWeChat = YES;
    // 微信请求App提供内容， 需要app提供内容后使用sendRsp返回
    if(_blockRequestMessageToSendWeChat)
    {
        _blockRequestMessageToSendWeChat(self);
    }
}

- (void)onShowMediaMessage:(WXMediaMessage *) message
{
    // 微信启动， 有消息内容。
    //显示微信传过来的内容
    WXAppExtendObject *obj = message.mediaObject;
    if(_blockShowMediaMessageFromWeChat)
    {
        _blockShowMediaMessageFromWeChat(obj);
    }
}

#pragma mark - some tool function
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

#pragma mark - do some action
- (void)sendTextToWeChat:(NSString*)text scene:(ENUM_TWECHAT_SCENE)scene
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.text = text;
    req.scene = scene;
    [WXApi sendReq:req];
}

- (void)sendTextToWeChat:(NSString*)text 
{
    [self sendTextToWeChat:text scene:_scene];
}

- (void)sendTextFromWeChat:(NSString*)text
{
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.text = text;
    resp.bText = YES;
    [WXApi sendResp:resp];
}

- (void)sendAppContentToWeChat:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage extInfo:(NSString*)extInfo url:(NSString*)url fileData:(NSData*)fileData scene:(ENUM_TWECHAT_SCENE)scene
{
    // 发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = extInfo;
    ext.url = url;
    if(fileData && fileData.length <= FILE_DATA_BUFFER_SIZE)
    {
        ext.fileData = fileData;
    }
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    [WXApi sendReq:req];
}

- (void)sendAppContentToWeChat:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage extInfo:(NSString*)extInfo url:(NSString*)url fileData:(NSData*)fileData
{
    [self sendAppContentToWeChat:title description:description thumbImage:thumbImage extInfo:extInfo url:url fileData:fileData scene:_scene];
}

- (void)sendAppContentBackToWeChat:(NSString*)title description:(NSString*)description thumbImage:(UIImage*)thumbImage extInfo:(NSString*)extInfo url:(NSString*)url fileData:(NSData*)fileData
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.extInfo = extInfo;
    ext.url = url;
    if(fileData && fileData.length <= FILE_DATA_BUFFER_SIZE)
    {
        ext.fileData = fileData;
    }
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    [WXApi sendResp:resp];
}

- (void)sendImageToWeChat:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL thumbImage:(UIImage*)thumbImage image:(UIImage*)image scene:(ENUM_TWECHAT_SCENE)scene
{
    //发送内容给微信
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = UIImagePNGRepresentation(image);
    ext.imageUrl = imageURL;
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

- (void)sendImageToWeChat:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL thumbImage:(UIImage*)thumbImage image:(UIImage*)image
{
    [self sendImageToWeChat:title description:description imageURL:imageURL thumbImage:thumbImage image:image scene:_scene];
}

- (void)sendImageBackToWeChat:(NSString*)title description:(NSString*)description imageURL:(NSString*)imageURL thumbImage:(UIImage*)thumbImage image:(UIImage*)image
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = UIImagePNGRepresentation(image);
    ext.imageUrl = imageURL;
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}

- (void)sendNewsToWeChat:(NSString*)title description:(NSString*)description thumbImage:thumbImage webPageURL:(NSString*)webPageURL scene:(ENUM_TWECHAT_SCENE)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = webPageURL;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

- (void)sendNewsToWeChat:(NSString*)title description:(NSString*)description thumbImage:thumbImage webPageURL:(NSString*)webPageURL
{
    [self sendNewsToWeChat:title description:description thumbImage:thumbImage webPageURL:webPageURL scene:_scene];
}

- (void)sendNewsBackToWeChat:(NSString*)title description:(NSString*)description thumbImage:thumbImage webPageURL:(NSString*)webPageURL
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = webPageURL;
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
}
@end
