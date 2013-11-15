//
//  NSString+URLEncoding.h
//  WriteDown
//
//  Created by Nguyen Xuan Vinh on 13/05/2013.
//  Copyright (c) 2013 Nguyen Xuan Vinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncoding)
- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;
@end
