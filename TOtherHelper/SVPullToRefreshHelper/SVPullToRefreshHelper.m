//
//  SVPullToRefreshHelper.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-29.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "SVPullToRefreshHelper.h"
#import "TLang.h"

@implementation SVPullToRefreshHelper

ShareInstanceDefine

+ (void)setPullToRefreshTopCustomViewWith:(SVPullToRefreshView*)pullToRefreshView
{
    UIView* view_SVPullToRefreshStateStopped = [[UIView alloc] initWithFrame:pullToRefreshView.bounds];
    view_SVPullToRefreshStateStopped.backgroundColor = [UIColor clearColor];
    UILabel* label_center = [[UILabel alloc] initWithFrame:view_SVPullToRefreshStateStopped.bounds];
    label_center.backgroundColor = [UIColor clearColor];
    label_center.text = @"下拉开始更新";
    label_center.font = [UIFont systemFontOfSize:12];
    label_center.textColor = [UIColor darkGrayColor];
    [label_center sizeToFit];
    label_center.center = view_SVPullToRefreshStateStopped.center;
    [view_SVPullToRefreshStateStopped addSubview:label_center];
    [pullToRefreshView setCustomView:view_SVPullToRefreshStateStopped forState:SVPullToRefreshStateStopped];
    
    UIView* view_SVPullToRefreshStateTriggered = [[UIView alloc] initWithFrame:pullToRefreshView.bounds];
    view_SVPullToRefreshStateTriggered.backgroundColor = [UIColor clearColor];
    label_center = [[UILabel alloc] initWithFrame:view_SVPullToRefreshStateTriggered.bounds];
    label_center.backgroundColor = [UIColor clearColor];
    label_center.text = @"释放之后更新";
    label_center.font = [UIFont systemFontOfSize:12];
    label_center.textColor = [UIColor darkGrayColor];
    [label_center sizeToFit];
    label_center.center = view_SVPullToRefreshStateTriggered.center;
    [view_SVPullToRefreshStateTriggered addSubview:label_center];
    [pullToRefreshView setCustomView:view_SVPullToRefreshStateTriggered forState:SVPullToRefreshStateTriggered];
    
    UIView* view_SVPullToRefreshStateLoading = [[UIView alloc] initWithFrame:pullToRefreshView.bounds];
    view_SVPullToRefreshStateLoading.backgroundColor = [UIColor clearColor];
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activity.center = view_SVPullToRefreshStateLoading.center;
    [activity startAnimating];
    [view_SVPullToRefreshStateLoading addSubview:activity];
    [pullToRefreshView setCustomView:view_SVPullToRefreshStateLoading forState:SVPullToRefreshStateLoading];
}

+ (void)setPullToRefreshBottomCustomViewWith:(SVPullToRefreshView*)pullToRefreshView
{
    UIView* view_SVPullToRefreshStateStopped = [[UIView alloc] initWithFrame:pullToRefreshView.bounds];
    view_SVPullToRefreshStateStopped.backgroundColor = [UIColor clearColor];
    UILabel* label_center = [[UILabel alloc] initWithFrame:view_SVPullToRefreshStateStopped.bounds];
    label_center.backgroundColor = [UIColor clearColor];
    label_center.text = @"上拉开始更新";
    label_center.font = [UIFont systemFontOfSize:12];
    label_center.textColor = [UIColor darkGrayColor];
    [label_center sizeToFit];
    label_center.center = view_SVPullToRefreshStateStopped.center;
    [view_SVPullToRefreshStateStopped addSubview:label_center];
    [pullToRefreshView setCustomView:view_SVPullToRefreshStateStopped forState:SVPullToRefreshStateStopped];
    
    UIView* view_SVPullToRefreshStateTriggered = [[UIView alloc] initWithFrame:pullToRefreshView.bounds];
    view_SVPullToRefreshStateTriggered.backgroundColor = [UIColor clearColor];
    label_center = [[UILabel alloc] initWithFrame:view_SVPullToRefreshStateTriggered.bounds];
    label_center.backgroundColor = [UIColor clearColor];
    label_center.text = @"释放之后更新";
    label_center.font = [UIFont systemFontOfSize:12];
    label_center.textColor = [UIColor darkGrayColor];
    [label_center sizeToFit];
    label_center.center = view_SVPullToRefreshStateTriggered.center;
    [view_SVPullToRefreshStateTriggered addSubview:label_center];
    [pullToRefreshView setCustomView:view_SVPullToRefreshStateTriggered forState:SVPullToRefreshStateTriggered];
    
    UIView* view_SVPullToRefreshStateLoading = [[UIView alloc] initWithFrame:pullToRefreshView.bounds];
    view_SVPullToRefreshStateLoading.backgroundColor = [UIColor clearColor];
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activity.center = view_SVPullToRefreshStateLoading.center;
    [activity startAnimating];
    [view_SVPullToRefreshStateLoading addSubview:activity];
    [pullToRefreshView setCustomView:view_SVPullToRefreshStateLoading forState:SVPullToRefreshStateLoading];
}


@end
