//
//  AppDelegate.h
//  Play With Dock
//
//  Created by Venj Chu on 11/09/02.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *dynamicMenu;


- (IBAction)restoreDockIcon:(id)sender;
- (IBAction)changeDockIcon:(id)sender;
- (IBAction)changeDockIconWithCustomView:(id)sender;
- (IBAction)addBadge:(id)sender;
- (IBAction)addQQStyleBadge:(id)sender;
- (IBAction)removeBadge:(id)sender;
- (IBAction)showMinimizeBadge:(id)sender;
- (IBAction)removeMinimizeBadge:(id)sender;
- (IBAction)staticMenu:(id)sender;
- (IBAction)dynamicDockMenu:(id)sender;
@end
