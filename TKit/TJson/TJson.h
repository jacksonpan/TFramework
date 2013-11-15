//
//  TJson.h
//  MT
//
//  Created by jacksonpan on 13-5-15.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "TObject.h"

@interface TJson : TObject
@property (nonatomic, assign) NSStringEncoding stringEncoding;
@end

@interface NSString (TJson)
- (id)json;
@end

@interface NSData (TJson)
- (id)json;
@end

@interface NSDictionary (TJson)
- (NSData*)toJsonData;
- (NSString*)toJsonString;
@end

@interface NSArray (TJson)
- (NSData*)toJsonData;
- (NSString*)toJsonString;
@end

@interface NSNull (TJson)
- (NSData*)toJsonData;
- (NSString*)toJsonString;
- (id)json;
@end