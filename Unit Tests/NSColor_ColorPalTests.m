//
//  NSColor_ColorPalTests.m
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "NSColor+ColorPal.h"


@interface NSColor_ColorPalTests : XCTestCase

@end


@implementation NSColor_ColorPalTests

- (void)testColorWithHex
{
    NSColor *color = [NSColor colorWithHex:0x000000];
    XCTAssertNotNil(color);
    XCTAssertEqual(color.redComponent, 0.0f);
    XCTAssertEqual(color.greenComponent, 0.0f);
    XCTAssertEqual(color.blueComponent, 0.0f);
    XCTAssertEqual(color.alphaComponent, 1.0f);

    color = [NSColor colorWithHex:0x0D68AC];
    XCTAssertNotNil(color);
    XCTAssertEqualWithAccuracy(color.redComponent, 13 / 255.0f, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(color.greenComponent, 104 / 255.0f, FLT_EPSILON);
    XCTAssertEqualWithAccuracy(color.blueComponent, 172 / 255.0f, FLT_EPSILON);
    XCTAssertEqual(color.alphaComponent, 1.0f);
}

- (void)testHexColorValue
{
    int r = 13, g = 104, b = 172;

    NSColor *color = [NSColor colorWithRed:(r / 255.0f)green:(g / 255.0f)blue:(b / 255.0f)alpha:1.0f];
    XCTAssertNotNil(color);

    HexColor hex = color.hexColorValue;

    XCTAssertEqual(hex, 0x0D68AC);
}

- (void)testRedHexString
{
    NSColor *color = [NSColor colorWithHex:0xFF0000];

    NSColor *red = [NSColor redColor];

    XCTAssertEqualObjects(red, color);
}

- (void)testRedHex
{
    NSString *hex = @"#FF0000";

    NSColor *color = [NSColor colorWithHexString:hex];

    NSColor *red = [NSColor redColor];

    XCTAssertEqualObjects(red, color);
}

@end
