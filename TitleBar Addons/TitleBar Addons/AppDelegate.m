//
//  AppDelegate.m
//  TitleBar Addons
//
//  Created by Venj Chu on 11/08/27.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize accessoryView = _accessoryView;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)awakeFromNib {
    [self composeInterface];
}

- (void)composeInterface {
    NSView *themeFrame = [[self.window contentView] superview];
    
    NSRect themeFrameRect = [themeFrame frame];
    NSRect accessoryViewFrame = [self.accessoryView frame];
    NSRect newFrame = NSMakeRect(themeFrameRect.size.width - accessoryViewFrame.size.width,
                                 themeFrameRect.size.height - accessoryViewFrame.size.height,
                                 accessoryViewFrame.size.width,
                                 accessoryViewFrame.size.height);
    [self.accessoryView setFrame:newFrame];
    
    [themeFrame addSubview:self.accessoryView];
}

- (IBAction)buttonClicked:(id)sender {
    NSAlert *alert = [NSAlert alertWithMessageText:@"Button Clicked" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Botton on the titlebar was clicked!"];
    [alert runModal];
}
@end
