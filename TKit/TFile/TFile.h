//
//  TFile.h
//  vjmenu
//
//  Created by ren pan on 13-9-2.
//  Copyright (c) 2013年 ren pan. All rights reserved.
//

#import "TObject.h"

@interface TFile : TObject
+ (NSString*)loadStringFromMainBundleWithName:(NSString*)name;
+ (NSData*)loadDataFromMainBundleWithName:(NSString*)name;
+ (NSString*)loadStringFromPath:(NSString*)path;
+ (NSData*)loadDataFromPath:(NSString*)path;
+ (void)saveToDocumentWithData:(id)data name:(NSString*)name;
+ (NSString*)getMainBundlePathWithName:(NSString*)name;
+ (NSString*)getDocumentPath;
+ (NSString*)getDocumentPathWithPathComponent:(NSString*)path;
+ (BOOL)checkFileExistWithPath:(NSString*)path;
+ (void)copyFileFrom:(NSString*)sourcePath to:(NSString*)realPath;
+ (void)removeFileWithPath:(NSString*)path;
@end
