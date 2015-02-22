//
//  ColorTransfomer.m
//  ColorPal
//
//  Created by Ashton Williams on 14/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "ColorTransfomer.h"
#import <TransformerKit/NSValueTransformer+TransformerKit.h>
#import "NSColor+ColorPal.h"


NSString *const ColorTransfomerName = @"ColorTransfomerName";

@implementation ColorTransfomer

+ (void)load
{
    ColorTransfomer *transformer = [[self alloc] init];
    [self setValueTransformer:transformer forName:ColorTransfomerName];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

+ (Class)transformedValueClass
{
    return [NSColor class];
}

- (id)transformedValue:(id)value
{
    if ([value isKindOfClass:[NSString class]]) {
        return [self transformedValueFromString:value];
    }

    return nil;
}

- (id)transformedValueFromString:(NSString *)value
{
    return nil;
}

@end
