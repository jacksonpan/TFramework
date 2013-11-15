//
//  TStoryboardSegue.m
//  t2u
//
//  Created by ren pan on 13-7-1.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TStoryboardSegue.h"
#import "TViewController.h"

@implementation TStoryboardSegue
@synthesize isAnimate = _isAnimate;

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    _isAnimate = YES;
    return [super initWithIdentifier:identifier source:source destination:destination];
}

- (void)perform
{
    TViewController* current = self.sourceViewController;
    TViewController* next = self.destinationViewController;
    
    [current goNext:next animated:_isAnimate];
}
@end
