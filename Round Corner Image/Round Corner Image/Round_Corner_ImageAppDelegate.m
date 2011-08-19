//
//  Round_Corner_ImageAppDelegate.m
//  Round Corner Image
//
//  Created by Venj Chu on 11/08/19.
//  Copyright 2011年 Home. All rights reserved.
//

#import "Round_Corner_ImageAppDelegate.h"
#import "NSImage+RoundCorner.h"

@implementation Round_Corner_ImageAppDelegate

@synthesize window;
@synthesize imageView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSImage *image = [NSImage imageNamed:@"image"];
    NSLog(@"Before: %f, %f", image.size.width, image.size.height);
    // Set the 'real' size of NSImage.
    NSBitmapImageRep *rep = [NSBitmapImageRep imageRepWithData:[image TIFFRepresentation]];
    NSSize size = NSMakeSize([rep pixelsWide], [rep pixelsHigh]);
    image.size = size;
    NSLog(@"After: %f, %f", image.size.width, image.size.height);
    
    [self.imageView setImage:[image roundCornersImageCornerRadius:8]];
}

@end
