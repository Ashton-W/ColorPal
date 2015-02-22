//
//  Settings.m
//  ColorPal
//
//  Created by Ashton Williams on 24/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "Settings.h"

@implementation Settings

+ (instancetype)settingsWithDefaults
{
    id defaults = [super settingsWithName:@"Defaults" parent:nil];

    //set default values

    return defaults;
}

- (instancetype)init
{
    self = [super initWithName:@"CLI" parent:[Settings settingsWithDefaults]];
    if (!self) {
        return nil;
    }


    return self;
}

#pragma mark - sythesize macros

GB_SYNTHESIZE_BOOL(help, setHelp, @"help")
GB_SYNTHESIZE_BOOL(verbose, setVerbose, @"verbose")

GB_SYNTHESIZE_COPY(NSString *, inputFile, setInputFile, @"inputFile")
GB_SYNTHESIZE_COPY(NSString *, outputFile, setOutputFile, @"outputFile")


@end
