//
//  TDeviceToken.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-27.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TDeviceToken.h"
#import "TConfig.h"

@interface TDeviceToken ()

@end

@implementation TDeviceToken

ShareInstanceDefine

@synthesize deviceToken = _deviceToken;

- (void)_init
{
    
}

- (void)setDeviceToken:(NSString *)deviceToken
{
    _deviceToken = deviceToken;
    TConfig* c = [TConfig current];
    [c setObject:_deviceToken forKey:@"__deviceToken__"];
}

- (NSString*)deviceToken
{
    if(_deviceToken)
    {
        return _deviceToken;
    }
    else
    {
        TConfig* c = [TConfig current];
        id obj = [c objectForKey:@"__deviceToken__"];
        if(obj == nil || [obj isKindOfClass:[NSNull class]])
        {
            return nil;
        }
        else
        {
            _deviceToken = obj;
            return _deviceToken;
        }
    }
}
@end
