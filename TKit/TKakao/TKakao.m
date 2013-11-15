//
//  TKakao.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TKakao.h"

@interface TKakao ()
@property (nonatomic, strong) NSString* os;
@property (nonatomic, strong) NSString* devicetype;
@end

@implementation TKakao
ShareInstanceDefine

@synthesize installurl = _installurl;
@synthesize executeurl = _executeurl;
@synthesize os = _os;
@synthesize devicetype = _devicetype;

- (void)_init
{
    _os = @"ios";
    _devicetype = @"phone";
}

- (NSMutableArray*)buildUpMetaInfo
{
    NSMutableArray *metaInfoArray = [NSMutableArray array];
    NSDictionary *metaInfoIOS = [NSDictionary dictionaryWithObjectsAndKeys:
                                 _os, @"os",
                                 _devicetype, @"devicetype",
                                 _installurl, @"installurl",
                                 _executeurl, @"executeurl",
                                 nil];
    
    [metaInfoArray addObject:metaInfoIOS];
    return metaInfoArray;
}

- (void)sendToWithMessage:(NSString*)message url:(NSString*)url
{
    [KakaoLinkCenter openKakaoAppLinkWithMessage:message
                                             URL:url
                                     appBundleID:[[NSBundle mainBundle] bundleIdentifier]
                                      appVersion:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
                                         appName:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
                                   metaInfoArray:[self buildUpMetaInfo]];
}

@end
