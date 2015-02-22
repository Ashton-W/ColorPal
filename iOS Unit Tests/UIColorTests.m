//
//  UIColorTests.m
//  ColorPal
//
//  Created by Ashton Williams on 14/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <CoreGraphics/CoreGraphics.h>


@interface UIColorTests : XCTestCase

@end


@implementation UIColorTests

- (void)testNamedColorSpace
{
    UIColor *color = [UIColor redColor];
    CGColorRef colorRef = color.CGColor;
    CGColorSpaceRef colorSpaceRef = CGColorGetColorSpace(colorRef);

    XCTAssertEqual(colorSpaceRef, CGColorSpaceCreateDeviceRGB());
}

- (void)testColorWithRGBColorSpace
{
    UIColor *color = [UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000];
    CGColorRef colorRef = color.CGColor;
    CGColorSpaceRef colorSpaceRef = CGColorGetColorSpace(colorRef);

    XCTAssertEqual(colorSpaceRef, CGColorSpaceCreateDeviceRGB());
}

@end
