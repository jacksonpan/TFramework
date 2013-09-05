//
//  TNibLoader.h
//  MicroTransfer
//
//  Created by jacksonpan on 13-3-12.
//  Copyright (c) 2013年 weichuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TNibLoader : NSObject
+ (id)loadWithName:(NSString*)name index:(NSInteger)index;
+ (id)loadOneWithName:(NSString *)name;
@end

@interface UIViewController (TNibLoader)
+ (id)loadNib;
@end

@interface UIView (TNibLoader)
+ (id)loadNib;
@end