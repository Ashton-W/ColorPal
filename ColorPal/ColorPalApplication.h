//
//  ColorPalApplication.h
//  ColorPal
//
//  Created by Ashton Williams on 2/02/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GBCommandLineParser;
@class Settings;


@interface ColorPalApplication : NSObject

@property (nonatomic) Settings *settings;

- (instancetype)initWithCommandLineParser:(GBCommandLineParser *)parser;
- (BOOL)main;

@end
