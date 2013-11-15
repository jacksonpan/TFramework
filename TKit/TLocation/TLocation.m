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

@implementation TLocation (extend)

static const double pi = 3.14159265358979324;

//
// Krasovsky 1940
//
// a = 6378245.0, 1/f = 298.3
// b = a * (1 - f)
// ee = (a^2 - b^2) / a^2;
static const double a = 6378245.0;
static const double ee = 0.00669342162296594323;

static const double x_pi = 3.14159265358979324 * 3000.0 / 180.0;

+ (BOOL)outOfChina:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude
{
    if (longitude < 72.004 || longitude > 137.8347)
    {
        return YES;
    }
    
    if (latitude < 0.8293 || latitude > 55.8271)
    {
        return YES;
    }
    return NO;
}

+ (double)transformLatitude:(double)x y:(double)y
{
    double ret = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * pi) + 20.0 *sin(2.0 * x * pi)) * 2.0 / 3.0;
    ret += (20.0 * sin(y * pi) + 40.0 * sin(y / 3.0 * pi)) * 2.0 / 3.0;
    ret += (160.0 * sin(y / 12.0 * pi) + 320 * sin(y * pi / 30.0)) * 2.0 / 3.0;
    return ret;
}

+ (double)transformLongitude:(double)x y:(double)y
{
    double ret = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * sqrt(abs(x));
    ret += (20.0 * sin(6.0 * x * pi) + 20.0 * sin(2.0 * x * pi)) * 2.0 / 3.0;
    ret += (20.0 * sin(x * pi) + 40.0 * sin(x / 3.0 * pi)) * 2.0 / 3.0;
    ret += (150.0 * sin(x / 12.0 * pi) + 300.0 * sin(x / 30.0 * pi)) * 2.0 / 3.0;
    return ret;
}

///
///  WGS-84 到 GCJ-02 的转换
///
+ (CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgLocation
{
    CLLocationCoordinate2D mgLocation;
    if ([self outOfChina:wgLocation.latitude longitude:wgLocation.longitude])
    {
        mgLocation = wgLocation;
        return mgLocation;
    }
    double dLat = [self transformLatitude:wgLocation.longitude-105.0f y:wgLocation.latitude-35.0f];
    double dLon = [self transformLongitude:wgLocation.longitude-105.0 y:wgLocation.latitude-35.0];
    double radLat = wgLocation.latitude / 180.0 * pi;
    double magic = sin(radLat);
    magic = 1 - ee * magic * magic;
    double sqrtMagic = sqrt(magic);
    dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
    dLon = (dLon * 180.0) / (a / sqrtMagic * cos(radLat) * pi);
    mgLocation.latitude = wgLocation.latitude + dLat;
    mgLocation.longitude = wgLocation.longitude + dLon;
    return mgLocation;
}

///
///  GCJ-02 坐标转换成 BD-09 坐标
///

+ (CLLocationCoordinate2D)bd_encrypt:(CLLocationCoordinate2D)gcLocation
{
    double x = gcLocation.longitude, y = gcLocation.latitude;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) + 0.000003 * cos(x * x_pi);
    return CLLocationCoordinate2DMake(z * sin(theta) + 0.006, z * cos(theta) + 0.0065);
}

///
///   BD-09 坐标转换成 GCJ-02坐标
///
///
+ (CLLocationCoordinate2D)bd_decrypt:(CLLocationCoordinate2D)bdLocation
{
    double x = bdLocation.longitude - 0.0065, y = bdLocation.latitude - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * x_pi);
    double theta = atan2(y, x) - 0.000003 * cos(x * x_pi);
    return CLLocationCoordinate2DMake(z * sin(theta), z * cos(theta));
}

+ (CLLocationCoordinate2D)baiduCoordinateToGoogle:(CLLocationCoordinate2D)baidu
{
    CLLocationCoordinate2D google;
    google = [self bd_decrypt:baidu];
    return google;
}

+ (CLLocationCoordinate2D)googleCoordinateToBaidu:(CLLocationCoordinate2D)google
{
    CLLocationCoordinate2D baidu;
    baidu = [self bd_encrypt:google];
    return baidu;
}
@end
