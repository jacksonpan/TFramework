//
//  TTabBar.h
//  cpblm
//
//  Created by jack on 13-11-2.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TView.h"

@class TTabBar;
@class TTabBarItem;

typedef BOOL(^tabBar_shouldSelectIndex)(TTabBar* tabBar, NSInteger index);
typedef void(^tabBar_didSelectIndex)(TTabBar* tabBar, NSInteger index);

@interface TTabBar : TView
@property (nonatomic, strong) tabBar_shouldSelectIndex block_tabBar_shouldSelectIndex;
@property (nonatomic, strong) tabBar_didSelectIndex block_tabBar_didSelectIndex;

- (void)setBlock_tabBar_shouldSelectIndex:(tabBar_shouldSelectIndex)block_tabBar_shouldSelectIndex;
- (void)setBlock_tabBar_didSelectIndex:(tabBar_didSelectIndex)block_tabBar_didSelectIndex;

@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIImageView *animatedView;

- (id)initWithFrame:(CGRect)frame TTabBarItems:(NSArray *)items;


- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithTTabBarItem:(TTabBarItem *)item atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;
@end
