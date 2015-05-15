//
//  OptionsHelper.m
//  ColorPal
//
//  Created by Ashton Williams on 24/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "OptionsHelper.h"
#import <GBCli/GBCli.h>


@implementation OptionsHelper

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    [self registerSeparator:@"OPTIONS"];
    [self registerOption:'i' long:@"inputFile" description:@"path to input colors" flags:GBOptionOptionalValue];
    [self registerOption:'o' long:@"outputFile" description:@"path to output colors" flags:GBOptionOptionalValue];

    [self registerSeparator:@"MISC."];
    [self registerOption:'v' long:@"verbose" description:@"Verbose output" flags:GBOptionNoValue];
    [self registerOption:'?' long:@"help" description:@"Display this help and exit" flags:GBOptionNoValue];

    [self registerOption:0 long:@"version" description:@"Display version and exit" flags:GBOptionNoValue];

    return self;
}

@end
