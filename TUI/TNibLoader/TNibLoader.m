//
//  TNibLoader.m
//  MicroTransfer
//
//  Created by jacksonpan on 13-3-12.
//  Copyright (c) 2013年 weichuan. All rights reserved.
//

#import "TNibLoader.h"

@implementation TNibLoader
+ (id)loadWithName:(NSString*)name index:(NSInteger)index
{
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:name owner:self options:nil];
    return [objects objectAtIndex:index];
}

+ (id)loadOneWithName:(NSString *)name
{
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:name owner:self options:nil];
    return [objects objectAtIndex:0];
}
@end

@implementation UIViewController (TNibLoader)
+ (id)loadNib
{
    NSString* selfName = [NSString stringWithUTF8String:object_getClassName(self)];
    NSLog(@"%@",selfName);
    id object = [TNibLoader loadOneWithName:selfName];
    return object;
}

- (id)initWithOwnNameNib
{
    NSString* selfName = [NSString stringWithUTF8String:object_getClassName(self)];
    NSLog(@"%@",selfName);
    self = [self initWithNibName:selfName bundle:[NSBundle mainBundle]];
    if(self)
    {
        
    }
    return self;
}
@end

@implementation UIView (TNibLoader)
+ (id)loadNib
{
    NSString* selfName = [NSString stringWithUTF8String:object_getClassName(self)];
    NSLog(@"%@",selfName);
    id object = [TNibLoader loadOneWithName:selfName];
    return object;
}
@end