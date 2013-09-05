//
//  TLocation.h
//  vjmenu
//
//  Created by ren pan on 13-9-4.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"
#import <CoreLocation/CoreLocation.h>

typedef void(^locationManager_didUpdateLocations)(CLLocationManager* manager, NSArray* locations);

@interface TLocation : TObject
- (void)start;
- (void)stop;
- (void)addListener:(locationManager_didUpdateLocations)block;
- (void)removeListener:(locationManager_didUpdateLocations)block;
- (void)removeAllListener;
@end
