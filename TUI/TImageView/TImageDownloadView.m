//
//  TImageDownloadView.m
//  t2u
//
//  Created by ren pan on 13-7-11.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TImageDownloadView.h"
#import "OTCircleProgressView.h"
#import "UIColor+FlatUI.h"
#import "TLog.h"

@interface TImageDownloadView ()
{
    
}
@property (nonatomic, strong) OTCircleProgressView* progressView;
@property (nonatomic, strong) UIButton* btnClick;
@end

@implementation TImageDownloadView
@synthesize progressView = _progressView;
@synthesize btnClick = _btnClick;
@synthesize blockImageClick = _blockImageClick;
@synthesize imageURL = _imageURL;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self _init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self _init];
    }
    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    self = [super initWithImage:image highlightedImage:highlightedImage];
	if (self)
    {
		[self _init];
	}
	return self;
}

- (void)_init
{
    self.backgroundColor = [UIColor silverFlatColor];
    if(_progressView == nil)
    {
        self.userInteractionEnabled = YES;
        
        CGRect f = self.frame;
        CGFloat x, y, width, height;
        width = 40;
        height = 40;
        x = (f.size.width - width)/2;
        y = (f.size.height - height)/2;
        
        CGRect pf = {{x, y}, {width, height}};
        _progressView = [[OTCircleProgressView alloc] initWithFrame:pf];
        _progressView.roundedCorners = YES;
        _progressView.beginRadians = 4.4 * M_PI_4;
        _progressView.trackRadians = 5.6 * M_PI_4;
        [self addSubview:_progressView];
        
        _btnClick = [UIButton buttonWithType:UIButtonTypeCustom];
        _btnClick.frame = self.bounds;
        [_btnClick addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_btnClick];
        [self progressShow:NO];
    }
}

- (void)click:(id)sender
{
    if(_blockImageClick)
    {
        _blockImageClick(self);
    }
}

- (void)progressShow:(BOOL)show
{
    BOOL isHidden = _progressView.hidden;
    if(show)
    {
        if(isHidden)
        {
            [_progressView setHidden:NO];
        }
    }
    else
    {
        if(!isHidden)
        {
            [_progressView setHidden:YES];
        }
    }
}

- (void)setImageWithURL:(NSURL*)url placeholderImage:(UIImage*)placeholderImage completion:(TImageDownloadProgressCompletionBlock)completion
{
    _imageURL = url;
    [self progressShow:YES];
    [_progressView setProgress:0];
    _progressView.indeterminate = YES;
    TImageDownloadView* _self = self;
    [self setImageWithURL:_imageURL placeholderImage:placeholderImage completion:completion progress:^(NSURL *imageURL, CGFloat percent) {
        if([url isEqual:imageURL])
        {
            [_self progressShow:YES];
            [_self.progressView setProgress:percent animated:NO];
        }
    } startDownload:nil endDownload:^(BOOL success) {
        [_self progressShow:NO];
        _self.progressView.indeterminate = NO;
    }];
}

@end
