//
//  AppDelegate.h
//  Screen Grab
//
//  Created by Venj Chu on 11/09/01.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSImageView *imageView;

- (IBAction)grabScreen:(id)sender;

@end
