//
//  NSColorList+YAML.h
//  ColorPal
//
//  Created by Ashton Williams on 1/03/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColorList (YAML)

+ (instancetype)colorListFromYAML:(NSString *)yaml;

@end
