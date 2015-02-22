//
//  ColorBinaryExporter.m
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "ColorBinaryExporter.h"


@implementation ColorBinaryExporter

- (instancetype)initWithColorList:(NSColorList *)colors
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _colors = colors;

    return self;
}

- (BOOL)writeToFile:(NSString *)path
{
    NSParameterAssert(path);
    return [self.colors writeToFile:path];
}

- (BOOL)writeToColorListsDirectory
{
    return [self.colors writeToFile:nil];
}

@end
