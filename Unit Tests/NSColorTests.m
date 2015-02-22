//
//  NSColorTests.m
//  ColorPal
//
//  Created by Ashton Williams on 14/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>


@interface NSColorTests : XCTestCase

@end


@implementation NSColorTests

- (void)testNamedColorSpace
{
    NSColor *redColor = [NSColor redColor];

    NSColorSpace *colorSpace = redColor.colorSpace;

    XCTAssertEqualObjects(colorSpace, [NSColorSpace genericRGBColorSpace]);
}

- (void)testColorWithRGBColorSpace
{
    NSColor *color = [NSColor colorWithCalibratedRed:0.000 green:1.000 blue:0.502 alpha:1.000];

    NSColorSpace *colorSpace = color.colorSpace;

    XCTAssertEqualObjects(colorSpace, [NSColorSpace genericRGBColorSpace]);
}

@end
