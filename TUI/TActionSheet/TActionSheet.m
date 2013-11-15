//
//  TActionSheet.m
//  VJMenu_iOS7
//
//  Created by jack on 13-10-25.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TActionSheet.h"

@interface TActionSheet () <UIActionSheetDelegate>
{
    
}
@property (nonatomic, strong) NSMutableArray* blockList;
@end

@implementation TActionSheet

ShareInstanceDefine

@synthesize actionSheet = _actionSheet;
@synthesize blockList = _blockList;

- (void)_init
{
    if(_blockList == nil)
    {
        _blockList = [NSMutableArray new];
    }
}

- (UIActionSheet*)actionSheetWithTitle:(NSString*)title
{
    _actionSheet = [[UIActionSheet alloc] init];
    _actionSheet.title = title;
    _actionSheet.delegate = self;
    
    return _actionSheet;
}

- (void)showInView:(UIView*)view
{
    [_actionSheet showInView:view];
}

- (void)addButtonWithTitle:(NSString*)title block:(clickedButton)block
{
    [_actionSheet addButtonWithTitle:title];
    if(block)
    {
        [_blockList addObject:block];
    }
    else
    {
        [_blockList addObject:[NSNull null]];
    }
}

- (void)addCancelButtonWithTitle:(NSString*)title block:(clickedButton)block
{
    NSInteger index = [_actionSheet addButtonWithTitle:title];
    _actionSheet.cancelButtonIndex = index;
    if(block)
    {
        [_blockList addObject:block];
    }
    else
    {
        [_blockList addObject:[NSNull null]];
    }
}

- (void)addDestructiveButtonWithTitle:(NSString*)title block:(clickedButton)block
{
    NSInteger index = [_actionSheet addButtonWithTitle:title];
    _actionSheet.destructiveButtonIndex = index;
    if(block)
    {
        [_blockList addObject:block];
    }
    else
    {
        [_blockList addObject:[NSNull null]];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    id obj = [_blockList objectAtIndex:buttonIndex];
    if([obj isKindOfClass:[NSNull class]])
    {
        return;
    }
    clickedButton block = obj;
    if(block)
    {
        block();
    }
}
@end
