//
//  TView.m
//  vjmenu
//
//  Created by ren pan on 13-9-7.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TView.h"

@implementation TView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    
}
@end
