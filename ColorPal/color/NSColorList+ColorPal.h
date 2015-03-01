//
//  NSColorList+ColorPal.h
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSColorList+YAML.h"

@interface NSColorList (ColorPal)

+ (instancetype)colorListFromPlist:(NSString *)plist;
+ (instancetype)colorListFromJSON:(NSString *)json;
+ (instancetype)colorListFromText:(NSString *)text;

@end
