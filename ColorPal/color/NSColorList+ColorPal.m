//
//  NSColorList+ColorPal.m
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "NSColorList+ColorPal.h"
#import "NSColor+ColorPal.h"


@implementation NSColorList (ColorPal)

+ (instancetype)colorListFromPlist:(NSString *)file
{
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:file];

    if (!plist) {
        return nil;
    }

    return [self colorListFromFile:file dictionary:plist];
}

+ (instancetype)colorListFromJSON:(NSString *)file
{
    NSError *error = nil;
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    NSAssert([json isKindOfClass:[NSDictionary class]], @"JSON not a dictionary");

    if (!json && ![json isKindOfClass:[NSDictionary class]]) {
        return nil;
    }

    return [self colorListFromFile:file dictionary:json];
}

+ (instancetype)colorListFromText:(NSString *)file
{
    NSError *error = nil;
    NSString *text = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];

    __block NSString *colorListName;

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];

    NSMutableCharacterSet *skippedCharacters = [NSMutableCharacterSet characterSetWithCharactersInString:@"#"];
    [skippedCharacters formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];
    [skippedCharacters formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];

    [text enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
        
        //ignore comment lines
        NSString *trimmedLine = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ([trimmedLine hasPrefix:@"#"] || [trimmedLine hasPrefix:@"//"]) {
            return;
        }
        
        NSScanner *scanner = [NSScanner scannerWithString:line];
        scanner.charactersToBeSkipped = skippedCharacters;
        
        NSString *name;
        NSString *color;
        
        [scanner scanCharactersFromSet:[NSCharacterSet letterCharacterSet] intoString:&name];
        [scanner scanCharactersFromSet:[NSCharacterSet alphanumericCharacterSet] intoString:&color];
        
        if (name && color) {
            [dict setValue:color forKey:name];
        }
        else if (name && !colorListName) {
            colorListName = name;
        }
        else if ([line length] > 0) {
            NSLog(@"Couldn't read line: %@", line);
        }
    }];

    if (colorListName) {
        return [self colorListWithName:colorListName colors:dict];
    }
    else {
        return [self colorListFromFile:file dictionary:dict];
    }
}

#pragma mark -

+ (instancetype)colorListFromFile:(NSString *)file dictionary:(NSDictionary *)dictionary
{
    NSString *name = [[file lastPathComponent] stringByDeletingPathExtension];
    NSDictionary *colors = dictionary;

    NSString *firstKey = [dictionary allKeys].firstObject;
    if ([dictionary[firstKey] isKindOfClass:[NSDictionary class]]) {
        // key is the name of the list
        name = firstKey;
        colors = dictionary[firstKey];
    }

    return [self colorListWithName:name colors:colors];
}

+ (instancetype)colorListWithName:(NSString *)name colors:(NSDictionary *)colors
{
    NSColorList *colorList = [[NSColorList alloc] initWithName:name];

    for (NSString *key in [colors allKeys]) {
        NSString *hexString = colors[key];
        NSColor *color = [NSColor colorWithHexString:hexString];
        [colorList setColor:color forKey:key];
    }

    return colorList;
}

@end
