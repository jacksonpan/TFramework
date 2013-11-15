//
//  HPGrowingTextViewHelper.h
//  VJMenu_iOS7
//
//  Created by jack on 13-9-20.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"
#import "HPGrowingTextView.h"

typedef BOOL(^growingTextViewShouldBeginEditing)(HPGrowingTextView* growingTextView);
typedef BOOL(^growingTextViewShouldEndEditing)(HPGrowingTextView* growingTextView);

typedef void(^growingTextViewDidBeginEditing)(HPGrowingTextView* growingTextView);
typedef void(^growingTextViewDidEndEditing)(HPGrowingTextView* growingTextView);

typedef BOOL(^growingTextViewShouldChangeTextInRange)(HPGrowingTextView* growingTextView, NSRange range, NSString* replacementText);
typedef void(^growingTextViewDidChange)(HPGrowingTextView* growingTextView);

typedef void(^growingTextViewWillChangeHeight)(HPGrowingTextView* growingTextView, float height);
typedef void(^growingTextViewDidChangeHeight)(HPGrowingTextView* growingTextView, float height);

typedef void(^growingTextViewDidChangeSelection)(HPGrowingTextView* growingTextView);
typedef BOOL(^growingTextViewShouldReturn)(HPGrowingTextView* growingTextView);

@interface HPGrowingTextViewHelper : TObject
@property (nonatomic, strong) growingTextViewShouldBeginEditing blockGrowingTextViewShouldBeginEditing;
@property (nonatomic, strong) growingTextViewShouldEndEditing blockGrowingTextViewShouldEndEditing;
@property (nonatomic, strong) growingTextViewDidBeginEditing blockGrowingTextViewDidBeginEditing;
@property (nonatomic, strong) growingTextViewDidEndEditing blockGrowingTextViewDidEndEditing;
@property (nonatomic, strong) growingTextViewShouldChangeTextInRange blockGrowingTextViewShouldChangeTextInRange;
@property (nonatomic, strong) growingTextViewDidChange blockGrowingTextViewDidChange;
@property (nonatomic, strong) growingTextViewWillChangeHeight blockGrowingTextViewWillChangeHeight;
@property (nonatomic, strong) growingTextViewDidChangeHeight blockGrowingTextViewDidChangeHeight;
@property (nonatomic, strong) growingTextViewDidChangeSelection blockGrowingTextViewDidChangeSelection;
@property (nonatomic, strong) growingTextViewShouldReturn blockGrowingTextViewShouldReturn;

- (void)setBlockGrowingTextViewShouldBeginEditing:(growingTextViewShouldBeginEditing)blockGrowingTextViewShouldBeginEditing;
- (void)setBlockGrowingTextViewShouldEndEditing:(growingTextViewShouldEndEditing)blockGrowingTextViewShouldEndEditing;
- (void)setBlockGrowingTextViewDidBeginEditing:(growingTextViewDidBeginEditing)blockGrowingTextViewDidBeginEditing;
- (void)setBlockGrowingTextViewDidEndEditing:(growingTextViewDidEndEditing)blockGrowingTextViewDidEndEditing;
- (void)setBlockGrowingTextViewShouldChangeTextInRange:(growingTextViewShouldChangeTextInRange)blockGrowingTextViewShouldChangeTextInRange;
- (void)setBlockGrowingTextViewDidChange:(growingTextViewDidChange)blockGrowingTextViewDidChange;
- (void)setBlockGrowingTextViewWillChangeHeight:(growingTextViewWillChangeHeight)blockGrowingTextViewWillChangeHeight;
- (void)setBlockGrowingTextViewDidChangeHeight:(growingTextViewDidChangeHeight)blockGrowingTextViewDidChangeHeight;
- (void)setBlockGrowingTextViewDidChangeSelection:(growingTextViewDidChangeSelection)blockGrowingTextViewDidChangeSelection;
- (void)setBlockGrowingTextViewShouldReturn:(growingTextViewShouldReturn)blockGrowingTextViewShouldReturn;

@property (nonatomic, strong) HPGrowingTextView* curGrowingTextView;

- (HPGrowingTextView*)growingTextViewWithFrame:(CGRect)frame;
@end
