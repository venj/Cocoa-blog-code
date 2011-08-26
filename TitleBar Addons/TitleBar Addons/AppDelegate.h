//
//  AppDelegate.h
//  TitleBar Addons
//
//  Created by Venj Chu on 11/08/27.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *accessoryView;

- (IBAction)buttonClicked:(id)sender;
- (void)composeInterface;
@end
