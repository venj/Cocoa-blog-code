//
//  AppDelegate.h
//  Custom Menu
//
//  Created by 朱 文杰 on 12-3-24.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMenu *attachedMenu;
@property (strong) NSMenuItem *myMenuItem;
@property (weak) IBOutlet NSButton *menuButton;
@property (strong) NSView *menuView;
- (IBAction)showMenu:(id)sender;

@end
