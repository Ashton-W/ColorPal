//
//  ColorPalApplication.m
//  ColorPal
//
//  Created by Ashton Williams on 2/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import "ColorPalApplication.h"
#import "Settings.h"
#import <GBCli/GBCli.h>
#import "NSColorList+ColorPal.h"
#import "ColorBinaryExporter.h"


@interface ColorPalApplication ()

@property (nonatomic) GBCommandLineParser *parser;

@end


@implementation ColorPalApplication

- (instancetype)initWithCommandLineParser:(GBCommandLineParser *)parser
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _parser = parser;

    return self;
}

- (BOOL)main
{
    NSString *inputFile = self.settings.inputFile;
    NSColorList *colorList;
    BOOL directory;

    if ([[NSFileManager defaultManager] fileExistsAtPath:inputFile isDirectory:&directory]) {
        if (directory) {
            //error
        }

        NSString *ext = [[inputFile pathExtension] lowercaseString];
        if ([ext isEqualToString:@"json"]) {
            colorList = [NSColorList colorListFromJSON:inputFile];
        }
        else if ([ext isEqualToString:@"plist"]) {
            colorList = [NSColorList colorListFromPlist:inputFile];
        }
        else {
            //error
        }
    }
    else {
        //error
    }

    NSString *outputFile = self.settings.outputFile;

    if ([[NSFileManager defaultManager] fileExistsAtPath:outputFile isDirectory:&directory]) {
        if (directory) {
            outputFile = [outputFile stringByAppendingPathComponent:colorList.name];
            outputFile = [outputFile stringByAppendingPathExtension:@"clr"];
        }
    }


    ColorBinaryExporter *exporter = [[ColorBinaryExporter alloc] initWithColorList:colorList];

    if (outputFile) {
        BOOL wrote = [exporter writeToFile:outputFile];
        if (!wrote) {
            //error
        }
    }
    else {
        BOOL wrote = [exporter writeToColorListsDirectory];
        if (!wrote) {
            //error
        }
    }

    return YES;
}

@end
