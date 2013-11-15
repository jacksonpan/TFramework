//
//  TKakao.h
//  VJMenu_iOS7
//
//  Created by jack on 13-10-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"
#import "KakaoLinkCenter.h"

@interface TKakao : TObject
@property (nonatomic, strong) NSString* installurl;
@property (nonatomic, strong) NSString* executeurl;

- (void)sendToWithMessage:(NSString*)message url:(NSString*)url;
@end
