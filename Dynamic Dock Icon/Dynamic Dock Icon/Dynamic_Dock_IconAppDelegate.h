//
//  Dynamic_Dock_IconAppDelegate.h
//  Dynamic Dock Icon
//
//  Created by Venj Chu on 11/08/06.
//  Copyright 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Dynamic_Dock_IconAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *_window;
    NSButton *dockIconSelector;
    NSTextField *infoText;
    NSStatusItem *trayItem;
    NSUserDefaults *defaults;
}

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSButton *dockIconSelector;
@property (strong) IBOutlet NSTextField *infoText;

- (IBAction)toggleDockIcon:(id)sender;

@end
