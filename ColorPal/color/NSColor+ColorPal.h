//
//  NSColor+ColorPal.h
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef unsigned int HexColor;


@interface NSColor (ColorPal)

+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (instancetype)colorWithHex:(HexColor)hex;

- (HexColor)hexColorValue;

@end
