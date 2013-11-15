//
//  TPickerView.m
//  vjmenu
//
//  Created by ren pan on 13-9-5.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TPickerView.h"

@interface TPickerView () <UIPickerViewDataSource, UIPickerViewDelegate>

@end

@implementation TPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

- (void)_init
{
    self.delegate = self;
    self.dataSource = self;
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(self.block_pickerView_numberOfComponentsInPickerView)
    {
        return self.block_pickerView_numberOfComponentsInPickerView(self);
    }
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(self.block_pickerView_numberOfRowsInComponent)
    {
        return self.block_pickerView_numberOfRowsInComponent(self, component);
    }
    return 3;
}

/*
// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(self.block_pickerView_widthForComponent)
    {
        return self.block_pickerView_widthForComponent(self, component);
    }
    return 0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if(self.block_pickerView_rowHeightForComponent)
    {
        return self.block_pickerView_rowHeightForComponent(self, component);
    }
    return 0;
}
*/

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(self.block_pickerView_titleForRow_forComponent)
    {
        return self.block_pickerView_titleForRow_forComponent(self, row, component);
    }
    return @"test";
}

/*
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) // attributed title is favored if both methods are implemented
{
    if(self.block_pickerView_attributedTitleForRow_forComponent)
    {
        return self.block_pickerView_attributedTitleForRow_forComponent(self, row, component);
    }
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if(self.block_pickerView_viewForRow_forComponent_reusingView)
    {
        return self.block_pickerView_viewForRow_forComponent_reusingView(self, row, component, view);
    }
    return nil;
}
*/

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(self.block_pickerView_didSelectRow_inComponent)
    {
        return self.block_pickerView_didSelectRow_inComponent(self, row, component);
    }
}
@end
