//
//  Round_Corner_ImageAppDelegate.h
//  Round Corner Image
//
//  Created by Venj Chu on 11/08/19.
//  Copyright 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Round_Corner_ImageAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSImageView *imageView;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSImageView *imageView;

@end
