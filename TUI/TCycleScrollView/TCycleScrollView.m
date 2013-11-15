//
//  TCycleScrollView.m
//  MT
//
//  Created by jacksonpan on 13-5-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TCycleScrollView.h"

@interface TCycleScrollView () <UIScrollViewDelegate>
{
    NSMutableArray* viewList;
}
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIPageControl* pageControl;
@end

@implementation TCycleScrollView
@synthesize totalPages = _totalPages;
@synthesize curPage = _curPage;
@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize blockNumberOfPages = _blockNumberOfPages;
@synthesize blockPageAtIndex = _blockPageAtIndex;
@synthesize blockClickWithIndex = _blockClickWithIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initUIWithFrame:frame];
    }
    return self;
}

- (void)initUIWithFrame:(CGRect)frame
{
    if(_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(frame.size.width, frame.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, self.bounds.size.height);
        //_scrollView.backgroundColor = [UIColor flatYellowColor];
        [self addSubview:_scrollView];
    }
    if(_pageControl == nil)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height - 20, frame.size.width, 20)];
        _pageControl.currentPage = 0;
        _pageControl.userInteractionEnabled = NO;
        [self addSubview:_pageControl];
    }
    if(viewList == nil)
    {
        viewList = [[NSMutableArray alloc] init];
    }
}

- (void)reloadData
{
    _totalPages = 0;
    if(_blockNumberOfPages)
    {
        _totalPages = _blockNumberOfPages(self);
    }
    else
    {
        return;
    }

    _pageControl.numberOfPages = _totalPages;
    [self loadData];
}

- (void)loadData
{
    _pageControl.currentPage = _curPage;
    
    //从scrollView上移除所有的subview
    NSArray *subViews = [_scrollView subviews];
    if([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self getDisplayViewWithCurPage:_curPage];
    
    for (int i = 0; i < 3; i++) {
        UIView *v = [viewList objectAtIndex:i];
        v.userInteractionEnabled = YES;
        UITapGestureRecognizer *Tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imagePressed:)];
        [Tap setNumberOfTapsRequired:1];
        [Tap setNumberOfTouchesRequired:1];
        [v addGestureRecognizer:Tap];

        v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
        [_scrollView addSubview:v];
    }
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:NO];
}

- (void)imagePressed:(UITapGestureRecognizer *)sender
{
    if(_blockClickWithIndex)
    {
        _blockClickWithIndex(_curPage);
    }
}

- (void)getDisplayViewWithCurPage:(NSInteger)page
{    
    NSInteger pre = [self validPageValue:_curPage-1];
    NSInteger last = [self validPageValue:_curPage+1];
    
    [viewList removeAllObjects];
    
    if(_blockPageAtIndex)
    {
        [viewList addObject:_blockPageAtIndex(self, pre)];
        [viewList addObject:_blockPageAtIndex(self, page)];
        [viewList addObject:_blockPageAtIndex(self, last)];
    }
}

- (NSInteger)validPageValue:(NSInteger)value
{
    if(value <= -1) value = _totalPages - 1;
    if(value >= _totalPages) value = 0;
    
    return value;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    int x = aScrollView.contentOffset.x;
    //往下翻一张
    if(x >= (2*self.frame.size.width))
    {
        _curPage = [self validPageValue:_curPage+1];
        [self loadData];
    }
    //往上翻
    if(x <= 0)
    {
        _curPage = [self validPageValue:_curPage-1];
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView
{
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:YES];
}

- (void)layoutSubviews
{
    [self reloadData];
}

- (void)jumpToPage:(NSInteger)pageIndex
{
    _curPage = [self validPageValue:pageIndex];
    [self loadData];
}
@end
