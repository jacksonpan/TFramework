//
//  TActionSheet.h
//  VJMenu_iOS7
//
//  Created by jack on 13-10-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"

typedef void(^clickedButton)(void);

@interface TActionSheet : TObject
@property (nonatomic, strong) UIActionSheet* actionSheet;
- (UIActionSheet*)actionSheetWithTitle:(NSString*)title;

- (void)addButtonWithTitle:(NSString*)title block:(clickedButton)block;
- (void)addCancelButtonWithTitle:(NSString*)title block:(clickedButton)block;
- (void)addDestructiveButtonWithTitle:(NSString*)title block:(clickedButton)block;

- (void)showInView:(UIView*)view;
@end
