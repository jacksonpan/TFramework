//
//  SVPullToRefreshHelper.h
//  VJMenu_iOS7
//
//  Created by jack on 13-10-29.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"
#import "SVPullToRefresh.h"

@interface SVPullToRefreshHelper : TObject
+ (void)setPullToRefreshTopCustomViewWith:(SVPullToRefreshView*)pullToRefreshView;
+ (void)setPullToRefreshBottomCustomViewWith:(SVPullToRefreshView*)pullToRefreshView;
@end
