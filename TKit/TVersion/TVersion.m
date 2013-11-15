//
//  TVersion.m
//  VJMenu_iOS7
//
//  Created by jack on 13-11-8.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TVersion.h"
#import "TConfig.h"

#define TVersionLastAppVersion          @"TVersionLastAppVersion"
#define TVersionLastOldAppVersion       @"TVersionLastOldAppVersion"

@implementation TVersion
ShareInstanceDefine

- (void)_init
{

}

- (NSString *)appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString*)lastAppVersion
{
    TConfig* c = [TConfig current];
    NSString* v = [[c objectForKey:TVersionLastAppVersion] isNSNull];
    return v?v:@"";
}

- (void)setLastAppVersion:(NSString*)version
{
    TConfig* c = [TConfig current];
    [c setObject:version forKey:TVersionLastAppVersion];
}

- (NSString*)OldAppVersion
{
    TConfig* c = [TConfig current];
    NSString* v = [[c objectForKey:TVersionLastOldAppVersion] isNSNull];
    return v?v:@"";
}

- (void)setOldAppVersion:(NSString*)version
{
    TConfig* c = [TConfig current];
    [c setObject:version forKey:TVersionLastOldAppVersion];
}

- (void)reset
{
    [self setLastAppVersion:nil];
    [self setOldAppVersion:nil];
}

- (void)appUpdateRunBlock:(TVersionAppUpdateRun)block
{
    if(![[self lastAppVersion] isEqualToString:[self appVersion]])
    {
        block();
        [self setLastAppVersion:[self appVersion]];
    }
}

- (void)appUpdateRunWithVersion:(NSString *)version block:(TVersionAppUpdateRun)block
{
	// version > lastMigrationVersion && version <= appVersion
    if([version compare:[self OldAppVersion] options:NSNumericSearch] == NSOrderedDescending &&[version compare:[self appVersion] options:NSNumericSearch] != NSOrderedDescending)
    {
        block();
        [self setOldAppVersion:version];
	}
}

@end
