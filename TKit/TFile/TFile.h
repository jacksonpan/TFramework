//
//  TFile.h
//  vjmenu
//
//  Created by ren pan on 13-9-2.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

@interface TFile : TObject
+ (NSString*)loadStringFromMainBundleWithName:(NSString*)name;
+ (NSData*)loadDataFromMainBundleWithName:(NSString*)name;
@end
