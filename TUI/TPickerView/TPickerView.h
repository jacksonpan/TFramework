//
//  TPickerView.h
//  vjmenu
//
//  Created by ren pan on 13-9-5.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import <UIKit/UIKit.h>

//datasource
typedef NSInteger(^pickerView_numberOfComponentsInPickerView)(UIPickerView* pickerView);
typedef NSInteger(^pickerView_numberOfRowsInComponent)(UIPickerView* pickerView, NSInteger component);
//delegate
typedef CGFloat(^pickerView_widthForComponent)(UIPickerView* pickerView, NSInteger component);
typedef CGFloat(^pickerView_rowHeightForComponent)(UIPickerView* pickerView, NSInteger component);

typedef NSString*(^pickerView_titleForRow_forComponent)(UIPickerView* pickerView, NSInteger row, NSInteger component);

typedef NSAttributedString*(^pickerView_attributedTitleForRow_forComponent)(UIPickerView* pickerView, NSInteger row, NSInteger component);

typedef UIView*(^pickerView_viewForRow_forComponent_reusingView)(UIPickerView* pickerView, NSInteger row, NSInteger component, UIView* view);
typedef void(^pickerView_didSelectRow_inComponent)(UIPickerView* pickerView, NSInteger row, NSInteger component);

@interface TPickerView : UIPickerView
@property (nonatomic, strong) pickerView_numberOfComponentsInPickerView block_pickerView_numberOfComponentsInPickerView;
@property (nonatomic, strong) pickerView_numberOfRowsInComponent block_pickerView_numberOfRowsInComponent;
@property (nonatomic, strong) pickerView_widthForComponent block_pickerView_widthForComponent;
@property (nonatomic, strong) pickerView_rowHeightForComponent block_pickerView_rowHeightForComponent;
@property (nonatomic, strong) pickerView_titleForRow_forComponent block_pickerView_titleForRow_forComponent;
@property (nonatomic, strong) pickerView_attributedTitleForRow_forComponent block_pickerView_attributedTitleForRow_forComponent;
@property (nonatomic, strong) pickerView_viewForRow_forComponent_reusingView block_pickerView_viewForRow_forComponent_reusingView;
@property (nonatomic, strong) pickerView_didSelectRow_inComponent block_pickerView_didSelectRow_inComponent;

- (void)setBlock_pickerView_numberOfComponentsInPickerView:(pickerView_numberOfComponentsInPickerView)block_pickerView_numberOfComponentsInPickerView;
- (void)setBlock_pickerView_numberOfRowsInComponent:(pickerView_numberOfRowsInComponent)block_pickerView_numberOfRowsInComponent;
- (void)setBlock_pickerView_widthForComponent:(pickerView_widthForComponent)block_pickerView_widthForComponent;
- (void)setBlock_pickerView_rowHeightForComponent:(pickerView_rowHeightForComponent)block_pickerView_rowHeightForComponent;
- (void)setBlock_pickerView_titleForRow_forComponent:(pickerView_titleForRow_forComponent)block_pickerView_titleForRow_forComponent;
- (void)setBlock_pickerView_attributedTitleForRow_forComponent:(pickerView_attributedTitleForRow_forComponent)block_pickerView_attributedTitleForRow_forComponent;
- (void)setBlock_pickerView_viewForRow_forComponent_reusingView:(pickerView_viewForRow_forComponent_reusingView)block_pickerView_viewForRow_forComponent_reusingView;
- (void)setBlock_pickerView_didSelectRow_inComponent:(pickerView_didSelectRow_inComponent)block_pickerView_didSelectRow_inComponent;
@end
