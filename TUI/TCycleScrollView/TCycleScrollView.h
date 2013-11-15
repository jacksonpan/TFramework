//
//  TCycleScrollView.h
//  MT
//
//  Created by jacksonpan on 13-5-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCycleScrollView;

typedef NSInteger(^numberOfPagesWithCycleScrollView)(TCycleScrollView* cycleScrollView);
typedef UIView*(^pageAtIndexWithCycleScrollView)(TCycleScrollView* cycleScrollView, NSInteger index);
typedef void(^clickWithIndexWithCycleScrollView)(NSInteger index);

@interface TCycleScrollView : UIScrollView
@property (nonatomic, readonly) NSInteger totalPages;
@property (nonatomic, readonly) NSInteger curPage;

@property (nonatomic, strong) numberOfPagesWithCycleScrollView blockNumberOfPages;
@property (nonatomic, strong) pageAtIndexWithCycleScrollView blockPageAtIndex;
@property (nonatomic, strong) clickWithIndexWithCycleScrollView blockClickWithIndex;

- (void)setBlockClickWithIndex:(clickWithIndexWithCycleScrollView)blockClickWithIndex;
- (void)setBlockNumberOfPages:(numberOfPagesWithCycleScrollView)blockNumberOfPages;
- (void)setBlockPageAtIndex:(pageAtIndexWithCycleScrollView)blockPageAtIndex;

- (void)reloadData;
- (void)jumpToPage:(NSInteger)pageIndex;
@end
