//
//  HexColorTransformer.m
//  ColorPal
//
//  Created by Ashton Williams on 15/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "HexColorTransformer.h"
#import <TransformerKit/NSValueTransformer+TransformerKit.h>

NSString *const HexColorTransformerName = @"HexColorTransformerName";

@implementation HexColorTransformer

+ (Class)transformedValueClass
{
    return [NSColor class];
}

- (id)transformedValue:(id)value
{
    if ([value isKindOfClass:[NSString class]]) {
        return [self transformedString:value];
    }

    return nil;
}

- (id)transformedString:(NSString *)value
{
    NSString *hex = [value stringByTrimmingCharactersInSet:[NSCharacterSet symbolCharacterSet]];

    // 3 digit hex #F00
    if ([hex length] == 3) {
        NSMutableString *sixString = [NSMutableString stringWithCapacity:6];
        for (unsigned int i = 0; i < 3; i++) {
            [sixString appendString:[hex substringWithRange:NSMakeRange(i, 1)]];
            [sixString appendString:[hex substringWithRange:NSMakeRange(i, 1)]];
        }
        hex = [sixString copy];
    }


    return nil;
}

@end
