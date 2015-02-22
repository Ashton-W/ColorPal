//
//  Settings.h
//  ColorPal
//
//  Created by Ashton Williams on 24/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <GBCli/GBSettings.h>


@interface Settings : GBSettings

@property (nonatomic, assign) BOOL verbose;
@property (nonatomic, assign) BOOL help;
@property (nonatomic, copy) NSString *inputFile;
@property (nonatomic, copy) NSString *outputFile;

@end
