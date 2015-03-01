//
//  NSColorList+YAML.m
//  ColorPal
//
//  Created by Ashton Williams on 1/03/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "NSColorList+YAML.h"
#import <YAML-Framework/YAMLSerialization.h>
#import "NSColorList+ColorPal.h"
#import "NSColor+ColorPal.h"


@implementation NSColorList (YAML)

+ (instancetype)colorListFromYAML:(NSString *)file
{
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSError *error;
    NSMutableArray *yaml = [YAMLSerialization objectsWithYAMLData:data options:kYAMLReadOptionStringScalars error:&error];

    if (!yaml) {
        return nil;
    }

    NSString *name = [[file lastPathComponent] stringByDeletingPathExtension];
    // get name from filename or yaml

    NSColorList *colorList = [[NSColorList alloc] initWithName:name];

    if ([yaml.firstObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *colors = (id)yaml.firstObject;

        for (NSString *key in [colors allKeys]) {
            NSString *hexString = colors[key];
            NSColor *color = [NSColor colorWithHexString:hexString];
            [colorList setColor:color forKey:key];
        }
    }

    return colorList;
}

@end
