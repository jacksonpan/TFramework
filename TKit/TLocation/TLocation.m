//
//  TLocation.m
//  vjmenu
//
//  Created by ren pan on 13-9-4.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TLocation.h"
#import "CLLocationDispatch.h"

@interface TLocation () <CLLocationManagerDelegate>
{
    
}
@property (nonatomic, assign) CLLocationDispatch* dispatch;
@property (nonatomic, strong) NSMutableArray* blockList;
@end

@implementation TLocation
@synthesize dispatch = _dispatch;
@synthesize blockList = _blockList;
ShareInstanceDefine

- (void)_init
{
    if(_dispatch == nil)
    {
        _dispatch = [CLLocationDispatch sharedDispatch];
        [_dispatch addListener:self];
    }
    if(_blockList == nil)
    {
        _blockList = [[NSMutableArray alloc] init];
    }
}

- (void)start
{
    if(_dispatch)
    {
        [_dispatch start];
    }
}

- (void)stop
{
    if(_dispatch)
    {
        [_dispatch stop];
    }
}

- (void)addListener:(locationManager_didUpdateLocations)block
{
    if(block == nil)
    {
        return;
    }
    if(![_blockList containsObject:block])
    {
        [_blockList addObject:block];
    }
}

- (void)removeListener:(locationManager_didUpdateLocations)block
{
    if(block == nil)
    {
        return;
    }
    [_blockList removeObject:block];
}

- (void)removeAllListener
{
    [_blockList removeAllObjects];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if(_blockList.count > 0)
    {
        for(locationManager_didUpdateLocations block in _blockList)
        {
            if(block)
            {
                block(manager, locations);
            }
        }
    }
}


@end
