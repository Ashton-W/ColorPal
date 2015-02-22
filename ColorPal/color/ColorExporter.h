//
//  ColorExporter.h
//  ColorPal
//
//  Created by Ashton Williams on 25/01/2015.
//  Copyright (c) 2015 Ashton-W. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorExporter <NSObject>

- (BOOL)writeToFile:(NSString *)path;

@end
