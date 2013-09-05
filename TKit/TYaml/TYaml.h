//
//  TYaml.h
//  Yaml
//
//  Created by Kenji Nishishiro <marvel@programmershigh.org> on 10/05/08.
//  Copyright 2010 Kenji Nishishiro. All rights reserved.
//
#import "TObject.h"

@interface TYaml : TObject

@end

@interface NSString (RadYAML)
- (id) YAMLValue;
@end

@interface NSObject (RadYAML)
- (id) YAMLRepresentation;
@end