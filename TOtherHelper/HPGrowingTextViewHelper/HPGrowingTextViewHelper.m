//
//  HPGrowingTextViewHelper.m
//  VJMenu_iOS7
//
//  Created by jack on 13-9-20.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "HPGrowingTextViewHelper.h"

@interface HPGrowingTextViewHelper () <HPGrowingTextViewDelegate>

@end

@implementation HPGrowingTextViewHelper
ShareInstanceDefine

@synthesize blockGrowingTextViewShouldBeginEditing = _blockGrowingTextViewShouldBeginEditing;
@synthesize blockGrowingTextViewShouldEndEditing = _blockGrowingTextViewShouldEndEditing;
@synthesize blockGrowingTextViewDidBeginEditing = _blockGrowingTextViewDidBeginEditing;
@synthesize blockGrowingTextViewDidEndEditing = _blockGrowingTextViewDidEndEditing;
@synthesize blockGrowingTextViewShouldChangeTextInRange = _blockGrowingTextViewShouldChangeTextInRange;
@synthesize blockGrowingTextViewDidChange = _blockGrowingTextViewDidChange;
@synthesize blockGrowingTextViewWillChangeHeight = _blockGrowingTextViewWillChangeHeight;
@synthesize blockGrowingTextViewDidChangeHeight = _blockGrowingTextViewDidChangeHeight;
@synthesize blockGrowingTextViewDidChangeSelection = _blockGrowingTextViewDidChangeSelection;
@synthesize blockGrowingTextViewShouldReturn = _blockGrowingTextViewShouldReturn;

- (BOOL)growingTextViewShouldBeginEditing:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewShouldBeginEditing)
    {
        return _blockGrowingTextViewShouldBeginEditing(growingTextView);
    }
    return YES;
}

- (BOOL)growingTextViewShouldEndEditing:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewShouldEndEditing)
    {
        _blockGrowingTextViewShouldEndEditing(growingTextView);
    }
    return YES;
}

- (void)growingTextViewDidBeginEditing:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewDidBeginEditing)
    {
        _blockGrowingTextViewDidBeginEditing(growingTextView);
    }
}

- (void)growingTextViewDidEndEditing:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewDidEndEditing)
    {
        _blockGrowingTextViewDidEndEditing(growingTextView);
    }
}

- (BOOL)growingTextView:(HPGrowingTextView *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if(_blockGrowingTextViewShouldChangeTextInRange)
    {
        return _blockGrowingTextViewShouldChangeTextInRange(growingTextView, range, text);
    }
    return YES;
}

- (void)growingTextViewDidChange:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewDidChange)
    {
        _blockGrowingTextViewDidChange(growingTextView);
    }
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    if(_blockGrowingTextViewWillChangeHeight)
    {
        _blockGrowingTextViewWillChangeHeight(growingTextView, height);
    }
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView didChangeHeight:(float)height
{
    if(_blockGrowingTextViewDidChangeHeight)
    {
        _blockGrowingTextViewDidChangeHeight(growingTextView, height);
    }
}

- (void)growingTextViewDidChangeSelection:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewDidChangeSelection)
    {
        _blockGrowingTextViewDidChangeSelection(growingTextView);
    }
}

- (BOOL)growingTextViewShouldReturn:(HPGrowingTextView *)growingTextView
{
    if(_blockGrowingTextViewShouldReturn)
    {
        return _blockGrowingTextViewShouldReturn(growingTextView);
    }
    return YES;
}

@synthesize curGrowingTextView = _curGrowingTextView;

- (HPGrowingTextView*)growingTextViewWithFrame:(CGRect)frame
{
    _curGrowingTextView = [[HPGrowingTextView alloc] initWithFrame:frame];
    _curGrowingTextView.delegate = self;
    return _curGrowingTextView;
}

@end
