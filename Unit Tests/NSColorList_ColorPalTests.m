//
//  ColorListTests.m
//  ColorPal
//
//  Created by Ashton Williams on 2/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "NSColorList+ColorPal.h"


@interface NSColorList_ColorPalTests : XCTestCase

@end


static NSString *PathForResourceInTestBundle(NSString *filename)
{
    NSBundle *bundle = [NSBundle bundleForClass:[NSColorList_ColorPalTests class]];
    NSString *path = [bundle pathForResource:[filename stringByDeletingPathExtension] ofType:[filename pathExtension]];
    return path;
}

@implementation NSColorList_ColorPalTests

- (void)testPlistLoading
{
    NSString *path = PathForResourceInTestBundle(@"plist-colors.plist");
    NSColorList *colors = [NSColorList colorListFromPlist:path];

    XCTAssertNotNil(colors);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

- (void)testPlistWithNameLoading
{
    NSString *path = PathForResourceInTestBundle(@"plist-colors-named.plist");
    NSColorList *colors = [NSColorList colorListFromPlist:path];

    XCTAssertNotNil(colors);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

- (void)testJSONLoading
{
    NSString *path = PathForResourceInTestBundle(@"json-colors.json");
    NSColorList *colors = [NSColorList colorListFromJSON:path];

    XCTAssertNotNil(colors);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

- (void)testJSONWithNameLoading
{
    NSString *path = PathForResourceInTestBundle(@"json-colors-named.json");
    NSColorList *colors = [NSColorList colorListFromJSON:path];

    XCTAssertNotNil(colors);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

- (void)testTextLoading
{
    NSString *path = PathForResourceInTestBundle(@"text-colors.txt");
    NSColorList *colors = [NSColorList colorListFromText:path];

    XCTAssertNotNil(colors);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

- (void)testTextWithNameLoading
{
    NSString *path = PathForResourceInTestBundle(@"text-colors-named.txt");
    NSColorList *colors = [NSColorList colorListFromText:path];

    XCTAssertNotNil(colors);
    XCTAssertEqualObjects(@"myColors", colors.name);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

- (void)testYAMLLoading
{
    NSString *path = PathForResourceInTestBundle(@"yaml-colors.yaml");
    NSColorList *colors = [NSColorList colorListFromYAML:path];

    XCTAssertNotNil(colors);
    XCTAssertNotNil([colors colorWithKey:@"myRed"]);
}

#pragma mark -

- (void)testLoadingStandardLists
{
    NSColorList *colors = [NSColorList colorListNamed:@"Apple"];

    for (NSString *key in colors.allKeys) {
        NSLog(@"%@: %@", key, [colors colorWithKey:key]);
    }
}

- (void)testAppleRedEqualsMyRed
{
    NSString *path = PathForResourceInTestBundle(@"json-colors.json");
    NSColorList *colors = [NSColorList colorListFromJSON:path];

    NSColorList *appleColors = [NSColorList colorListNamed:@"Apple"];

    NSColor *appleRed = [appleColors colorWithKey:@"Red"];
    NSColor *myRed = [colors colorWithKey:@"myRed"];

    XCTAssertEqualObjects(appleRed, myRed);
}

- (void)testSavedFileLoadsWithMatchingColors
{
    NSString *name = NSStringFromSelector(_cmd);
    NSString *fileName = [name stringByAppendingPathExtension:@"clr"];
    NSString *tempDir = NSTemporaryDirectory();
    NSString *path = [tempDir stringByAppendingPathComponent:fileName];

    //    NSColorList *colors = [[NSColorList alloc] initWithName:name fromFile:path];
    //
    //    NSColor *redColor = [colors setColor:[NSColor redColor] forKey:@"testColor"];
}

@end
