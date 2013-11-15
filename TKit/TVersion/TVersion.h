//
//  TVersion.h
//  VJMenu_iOS7
//
//  Created by jack on 13-11-8.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"

typedef void (^TVersionAppUpdateRun)(void);

@interface TVersion : TObject

- (void)appUpdateRunBlock:(TVersionAppUpdateRun)block;
- (void)appUpdateRunWithVersion:(NSString *)version block:(TVersionAppUpdateRun)block;

- (void)reset;
@end
