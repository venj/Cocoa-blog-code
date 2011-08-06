//
//  Dynamic_Dock_IconAppDelegate.m
//  Dynamic Dock Icon
//
//  Created by Venj Chu on 11/08/06.
//  Copyright 2011年 Home. All rights reserved.
//

#import "Dynamic_Dock_IconAppDelegate.h"
static NSString *kShowDockIcon = @"ShowDockIcon";

@implementation Dynamic_Dock_IconAppDelegate

@synthesize window = _window;
@synthesize dockIconSelector;
@synthesize infoText;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    // Set Dock status
    defaults = [NSUserDefaults standardUserDefaults];
    BOOL iconInDock = [[NSUserDefaults standardUserDefaults] boolForKey:kShowDockIcon];
    
    if (iconInDock) {
        ProcessSerialNumber psn = { 0, kCurrentProcess };
        TransformProcessType(&psn, kProcessTransformToForegroundApplication);
        [self.dockIconSelector setState:NSOnState];
    }
    else {
        [self.dockIconSelector setState:NSOffState];
    }
    
    NSZone *zone = [NSMenu menuZone];
	NSMenu *menu = [[NSMenu allocWithZone:zone] init];
	NSMenuItem *item;
	
	item = [menu addItemWithTitle:@"Testing" action:@selector(testAction:) keyEquivalent:@""];
	[item setTarget:self];
	
	item = [menu addItemWithTitle:@"Quit" action:@selector(quitAction:) keyEquivalent:@""];
	[item setTarget:self];
	
	trayItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
	[trayItem setMenu:menu];
	[trayItem setHighlightMode:YES];
	[trayItem setTitle:@"M"];
}

- (IBAction)testAction:(id)sender;
{
    NSAlert *alert = [NSAlert alertWithMessageText:@"Hello world!" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Hello world from menulet."];
    [alert runModal];
}

- (IBAction)quitAction:(id)sender;
{
	[NSApp terminate:sender];
}

- (IBAction)toggleDockIcon:(id)sender {
    NSUInteger state = [sender state];
    
    if (state == NSOnState) {
        ProcessSerialNumber psn = { 0, kCurrentProcess };
        TransformProcessType(&psn, kProcessTransformToForegroundApplication);
        self.infoText.hidden = YES;
        
        [defaults setBool:YES forKey:kShowDockIcon];
        [defaults synchronize];
    }
    else {
        [defaults setBool:NO forKey:kShowDockIcon];
        self.infoText.hidden = NO;
        [defaults synchronize];
    }
}
@end
