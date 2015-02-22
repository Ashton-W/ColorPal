//
//  ColorBinaryExporter.h
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "ColorExporter.h"


@interface ColorBinaryExporter : NSObject <ColorExporter>

@property (nonatomic, readonly) NSColorList *colors;


- (instancetype)initWithColorList:(NSColorList *)colors;

- (BOOL)writeToColorListsDirectory;

@end
