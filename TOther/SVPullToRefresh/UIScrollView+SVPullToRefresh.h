//
// UIScrollView+SVPullToRefresh.h
//
// Created by Sam Vermette on 23.04.12.
// Copyright (c) 2012 samvermette.com. All rights reserved.
//
// https://github.com/samvermette/SVPullToRefresh
//

#import <UIKit/UIKit.h>
#import <AvailabilityMacros.h>


@class SVPullToRefreshView;

@interface UIScrollView (SVPullToRefresh)

enum {
    SVPullToRefreshPositionTop = 0,
    SVPullToRefreshPositionBottom,
};

typedef NSUInteger SVPullToRefreshPosition;

- (void)addPullToRefreshTopWithActionHandler:(void (^)(void))actionHandler;
- (void)addPullToRefreshBottomWithActionHandler:(void (^)(void))actionHandler;
- (void)addPullToRefreshWithActionHandler:(void (^)(void))actionHandler position:(SVPullToRefreshPosition)position;
- (void)triggerPullToRefreshTop;
- (void)triggerPullToRefreshBottom;

- (void)stopRefreshTop;
- (void)stopRefreshBottom;
- (void)stopRefreshAll;

@property (nonatomic, strong, readonly) SVPullToRefreshView *pullToRefreshTopView;
@property (nonatomic, strong, readonly) SVPullToRefreshView *pullToRefreshBottomView;
@property (nonatomic, assign) BOOL showsPullToRefreshTop;
@property (nonatomic, assign) BOOL showsPullToRefreshBottom;
@end


enum {
    SVPullToRefreshStateStopped = 0,
    SVPullToRefreshStateTriggered,
    SVPullToRefreshStateLoading,
    SVPullToRefreshStateAll = 10
};

typedef NSUInteger SVPullToRefreshState;

@interface SVPullToRefreshView : UIView

@property (nonatomic, strong) UIColor *arrowColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *subtitleLabel;
@property (nonatomic, readwrite) UIActivityIndicatorViewStyle activityIndicatorViewStyle;

@property (nonatomic, readonly) SVPullToRefreshState state;
@property (nonatomic, readonly) SVPullToRefreshPosition position;

- (void)setTitle:(NSString *)title forState:(SVPullToRefreshState)state;
- (void)setSubtitle:(NSString *)subtitle forState:(SVPullToRefreshState)state;
- (void)setCustomView:(UIView *)view forState:(SVPullToRefreshState)state;

- (void)startAnimating;
- (void)stopAnimating;

// deprecated; use setSubtitle:forState: instead
@property (nonatomic, strong, readonly) UILabel *dateLabel DEPRECATED_ATTRIBUTE;
@property (nonatomic, strong) NSDate *lastUpdatedDate DEPRECATED_ATTRIBUTE;
@property (nonatomic, strong) NSDateFormatter *dateFormatter DEPRECATED_ATTRIBUTE;

// deprecated; use [self.scrollView triggerPullToRefresh] instead
- (void)triggerRefresh DEPRECATED_ATTRIBUTE;

@end
