//
//  TTabBar.m
//  cpblm
//
//  Created by jack on 13-11-2.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TTabBar.h"
#import "TTabBarItem.h"
#import "TTabBarButton.h"

@implementation TTabBar
@synthesize backgroundView = _backgroundView;
@synthesize buttons = _buttons;
@synthesize animatedView = _animatedView;
@synthesize block_tabBar_shouldSelectIndex = _block_tabBar_shouldSelectIndex;
@synthesize block_tabBar_didSelectIndex = _block_tabBar_didSelectIndex;

- (TTabBarButton*)addTabBarItem:(TTabBarItem*)item index:(NSInteger)index width:(CGFloat)width
{
    TTabBarButton* btn = [TTabBarButton buttonWithType:UIButtonTypeCustom];
    btn.showsTouchWhenHighlighted = NO;
    btn.adjustsImageWhenHighlighted = NO;
    btn.tag = index;
    btn.frame = CGRectMake(width * index, 0, width, self.frame.size.height);
    [btn.titleLabel setFont:[UIFont boldSystemFontOfSize:10]];
    if(item.title)
    {
        [btn setTitle:item.title forState:UIControlStateNormal];
    }
    if(item.imageIconDefault)
    {
        [btn setImage:item.imageIconDefault forState:UIControlStateNormal];
    }
    if(item.imageIconHighlighted)
    {
        [btn setImage:item.imageIconHighlighted forState:UIControlStateHighlighted];
    }
    if(item.imageIconSelected)
    {
        [btn setImage:item.imageIconSelected forState:UIControlStateSelected];
    }
    if(item.imageIconHighlighted && item.imageIconSelected)
    {
        [btn setImage:item.imageIconSelected forState:UIControlStateHighlighted|UIControlStateSelected];
    }
    if(item.backgroundImageDefault)
    {
        [btn setBackgroundImage:item.backgroundImageDefault forState:UIControlStateNormal];
    }
    if(item.backgroundImageHighlighted)
    {
        [btn setBackgroundImage:item.backgroundImageHighlighted forState:UIControlStateHighlighted];
    }
    if(item.backgroundImageSelected)
    {
        [btn setBackgroundImage:item.backgroundImageSelected forState:UIControlStateSelected];
    }
    if(item.backgroundImageHighlighted && item.backgroundImageSelected)
    {
        [btn setBackgroundImage:item.backgroundImageSelected forState:UIControlStateHighlighted|UIControlStateSelected];
    }

    [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (id)initWithFrame:(CGRect)frame TTabBarItems:(NSArray *)items
{
    self = [super initWithFrame:frame];
    if (self)
	{
		self.backgroundColor = [UIColor clearColor];
		_backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
		[self addSubview:_backgroundView];
		
		self.buttons = [NSMutableArray arrayWithCapacity:[items count]];
		CGFloat width = 320.0f / [items count];
		for (int i = 0; i < [items count]; i++)
		{
            TTabBarItem* item = [items objectAtIndex:i];
            TTabBarButton *btn = [self addTabBarItem:item index:i width:width];
			[self.buttons addObject:btn];
			[self addSubview:btn];
		}
    }
    return self;
}

- (void)setBackgroundImage:(UIImage *)img
{
	[_backgroundView setImage:img];
}

- (void)setAnimatedView:(UIImageView *)animatedView
{
    _animatedView = animatedView;
    [self addSubview:animatedView];
}

- (void)tabBarButtonClicked:(id)sender
{
    TTabBarButton *btn = sender;
    int index = btn.tag;
    
    if(_block_tabBar_shouldSelectIndex)
    {
        if(!_block_tabBar_shouldSelectIndex(self, index))
        {
            return;
        }
    }
    [self selectTabAtIndex:index];
}

- (void)selectTabAtIndex:(NSInteger)index
{
	for (int i = 0; i < [self.buttons count]; i++)
	{
		TTabBarButton *b = [self.buttons objectAtIndex:i];
		b.selected = NO;
	}
	TTabBarButton *btn = [self.buttons objectAtIndex:index];
	btn.selected = YES;
    if(_block_tabBar_didSelectIndex)
    {
        _block_tabBar_didSelectIndex(self, btn.tag);
    }
    [UIView animateWithDuration:0.2f animations:^{
        _animatedView.frame = CGRectMake(btn.frame.origin.x, _animatedView.frame.origin.y, _animatedView.frame.size.width, _animatedView.frame.size.height);
    }];
    
    NSLog(@"Select index: %d",btn.tag);
}

- (void)removeTabAtIndex:(NSInteger)index
{
    // Remove button
    [(TTabBarButton *)[self.buttons objectAtIndex:index] removeFromSuperview];
    [self.buttons removeObjectAtIndex:index];
    
    // Re-index the buttons
    CGFloat width = 320.0f / [self.buttons count];
    for (TTabBarButton *btn in self.buttons)
    {
        if (btn.tag > index)
        {
            btn.tag --;
        }
        btn.frame = CGRectMake(width * btn.tag, 0, width, self.frame.size.height);
    }
}

- (void)insertTabWithTTabBarItem:(TTabBarItem *)item atIndex:(NSUInteger)index
{
    // Re-index the buttons
    CGFloat width = 320.0f / ([self.buttons count] + 1);
    for (TTabBarButton *b in self.buttons)
    {
        if (b.tag >= index)
        {
            b.tag ++;
        }
        b.frame = CGRectMake(width * b.tag, 0, width, self.frame.size.height);
    }
    TTabBarButton *btn = [self addTabBarItem:item index:index width:width];
    [self.buttons insertObject:btn atIndex:index];
    [self addSubview:btn];
}

- (void)dealloc
{
    _backgroundView = nil;
    _buttons = nil;
    _animatedView = nil;
}


@end
