//
//  NSColor+ColorPal.m
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "NSColor+ColorPal.h"

@implementation NSColor (ColorPal)

+ (instancetype)colorWithHexString:(NSString *)hexString
{
    HexColor hex = 0;

    NSMutableCharacterSet *skippedCharacters = [NSMutableCharacterSet characterSetWithCharactersInString:@"#"];
    [skippedCharacters formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];
    [skippedCharacters formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];

    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    scanner.charactersToBeSkipped = skippedCharacters;

    [scanner scanHexInt:&hex];

    return [self colorWithHex:hex];
}

#pragma mark - HexColor

+ (instancetype)colorWithHex:(HexColor)hex
{
    CGFloat r = ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0f;
    CGFloat g = ((CGFloat)((hex & 0x00FF00) >> 8)) / 255.0f;
    CGFloat b = ((CGFloat)((hex & 0x0000FF) >> 0)) / 255.0f;

    return [self colorWithCalibratedRed:r
                                  green:g
                                   blue:b
                                  alpha:1.0];
}

- (HexColor)hexColorValue
{
    HexColor hex = 0;

    hex |= (int)(self.redComponent * 255.0f) << 16;
    hex |= (int)(self.greenComponent * 255.0f) << 8;
    hex |= (int)(self.blueComponent * 255.0f) << 0;

    return hex;
}

@end
