//
//  main.m
//  ColorPal
//
//  Created by Ashton Williams on 24/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GBCli/GBCli.h>
#import "OptionsHelper.h"
#import "Settings.h"
#import "ColorPalApplication.h"


int main(int argc, char **argv)
{
    BOOL code = 0;
    @autoreleasepool
    {
        Settings *settings = [[Settings alloc] init];
        OptionsHelper *options = [[OptionsHelper alloc] init];
        GBCommandLineParser *parser = [[GBCommandLineParser alloc] init];
        [parser registerSettings:settings];
        [parser registerOptions:options];
        [parser parseOptionsWithArguments:argv count:argc];

        if (argc == 1 || settings.help) {
            [options printHelp];
            return 0;
        }
        else if ([parser valueForOption:@"version"]) {
            [options printVersion];
            return 0;
        }

        ColorPalApplication *app = [[ColorPalApplication alloc] initWithCommandLineParser:parser];
        app.settings = settings;

        code = [app main];
    }
    return code;
}
