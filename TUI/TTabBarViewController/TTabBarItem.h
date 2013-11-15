//
//  TTabBarItem.h
//  cpblm
//
//  Created by jack on 13-11-3.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"

@interface TTabBarItem : TObject
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) UIImage* imageIconDefault;
@property (nonatomic, strong) UIImage* imageIconHighlighted;
@property (nonatomic, strong) UIImage* imageIconSelected;
@property (nonatomic, strong) UIImage* backgroundImageDefault;
@property (nonatomic, strong) UIImage* backgroundImageHighlighted;
@property (nonatomic, strong) UIImage* backgroundImageSelected;
@end
