//
//  AppDelegate.m
//  Play With Dock
//
//  Created by Venj Chu on 11/09/02.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import "AppDelegate.h"
#import "DockIconView.h"
#import "DockIconBadgeView.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize dynamicMenu = _dynamicMenu;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

/* Uncomment to replace static dock menu with dymamic dock menu.
// Dynamic Dock menu.
- (NSMenu *)applicationDockMenu:(NSApplication *)sender {
    return self.dynamicMenu;
}
*/

// Customize Dock Icon
- (IBAction)changeDockIcon:(id)sender {
    [NSApp setApplicationIconImage:[NSImage imageNamed:@"Icon"]];
}

// Restore Dock Icon
- (IBAction)restoreDockIcon:(id)sender {
    [NSApp setApplicationIconImage:nil];
}

// Draw Dock Icon with Custom View
- (IBAction)changeDockIconWithCustomView:(id)sender {
    DockIconView *dockView = [[[DockIconView alloc] init] autorelease];
    [[NSApp dockTile] setContentView: dockView];
    [[NSApp dockTile] display];
}

// Add badge
- (IBAction)addBadge:(id)sender {
    [[NSApp dockTile] setBadgeLabel:[NSString stringWithFormat:@"%d", random() % 11]];
}

// Remove badge
- (IBAction)removeBadge:(id)sender  {
    [[NSApp dockTile] setBadgeLabel:nil];
}

// Add QQ style badge;
- (IBAction)addQQStyleBadge:(id)sender {
    DockIconBadgeView *dockView = [[[DockIconBadgeView alloc] init] autorelease];
    dockView.labelText = [NSString stringWithFormat:@"%2d", random() % 101];
    [[NSApp dockTile] setContentView: dockView];
    [[NSApp dockTile] display];
}

// Show minimize icon badge
- (IBAction)showMinimizeBadge:(id)sender {
    [[self.window dockTile] setShowsApplicationBadge:YES];
}

// Remove minimize icon badge
- (IBAction)removeMinimizeBadge:(id)sender {
    [[self.window dockTile] setShowsApplicationBadge:NO];
}

// Static menu action
- (IBAction)staticMenu:(id)sender {
    NSAlert *alert = [NSAlert alertWithMessageText:@"Static Dock Menu" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Static dock menu clicked: %@", [sender title]];
    [alert runModal];
}

// Dynamic menu action
- (IBAction)dynamicDockMenu:(id)sender {
    NSAlert *alert = [NSAlert alertWithMessageText:@"Dynamic Dock Menu" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Dynamic dock menu clicked: %@", [sender title]];
    [alert runModal];
}

@end
