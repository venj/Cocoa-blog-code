//
//  AppDelegate.m
//  Custom Menu
//
//  Created by 朱 文杰 on 12-3-24.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "AppDelegate.h"
#import "NSImage+RoundCorner.h"
#define IMAGES_COUNT 8

@implementation AppDelegate
@synthesize attachedMenu = _attachedMenu;
@synthesize myMenuItem = _myMenuItem;
@synthesize menuButton = _menuButton;
@synthesize window = _window;
@synthesize menuView = _menuView;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [[self window] setAcceptsMouseMovedEvents:YES];
    
    // Some variables.
    NSInteger sideMargin = 25., headMargin=10., \
    seperateMargin = 2., imageWidth = 44., \
    imagesPerLine = 4., menuTitleHeight = 20.,\
    menuTitleLeftMargin = 20., menuTitleWidth = 180.;
    
    // Menus
    self.myMenuItem = [[NSMenuItem alloc] initWithTitle:@"My Menu" action:nil keyEquivalent:@""];
    self.myMenuItem.target = self;
    NSMenuItem *otherMenu = [[NSMenuItem alloc] initWithTitle:@"自定义头像..." action:@selector(doSomething:) keyEquivalent:@""];
    self.menuView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, \
                                                                sideMargin*2+seperateMargin*(imagesPerLine - 1)+imageWidth*imagesPerLine, \
                                                                imageWidth*(IMAGES_COUNT/imagesPerLine)+seperateMargin*(IMAGES_COUNT/imagesPerLine - 1)+headMargin*2+menuTitleHeight)];
    // Menu Label
    NSTextField *menuViewTitle = [[NSTextField alloc] initWithFrame:NSMakeRect(menuTitleLeftMargin, headMargin+(seperateMargin + imageWidth)*(IMAGES_COUNT/imagesPerLine), menuTitleWidth, menuTitleHeight)];
    menuViewTitle.stringValue = @"系统头像";
    menuViewTitle.textColor = [NSColor grayColor];
    menuViewTitle.backgroundColor = [NSColor controlColor];
    menuViewTitle.font = [NSFont systemFontOfSize:15];
    [menuViewTitle setEditable:NO];
    [menuViewTitle setBordered:NO];
    
    [self.menuView addSubview:menuViewTitle];
    
    // Menu Buttons
    for (int i = 0; i < IMAGES_COUNT; i++) {
        NSRect buttonRect = NSMakeRect(sideMargin + (imageWidth + seperateMargin) * (i % imagesPerLine), \
                                        headMargin + ((IMAGES_COUNT / imagesPerLine) - ((i / imagesPerLine) + 1)) * (imageWidth + seperateMargin), \
                                        imageWidth, imageWidth);
        NSButton *button = [[NSButton alloc] initWithFrame:buttonRect];
        [button setButtonType:NSSwitchButton];
        [button setImagePosition:NSImageOnly];
        button.image = [[NSImage imageNamed:[[NSString alloc] initWithFormat:@"avatar_small_%d", i + 1]] roundCornersImageCornerRadius:4];
        button.alternateImage = [[NSImage imageNamed:[[NSString alloc] initWithFormat:@"avatar_small_%d_h", i + 1]] roundCornersImageCornerRadius:5];
        [button.cell setHighlightsBy:NSNoCellMask];
        button.tag = i;
        button.target = self;
        button.action = @selector(buttonClicked:);
        [button setBordered:NO];
        
        int options = NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways | NSTrackingAssumeInside;
        NSTrackingArea *trackingArea;
        NSDictionary *userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:button,@"button", nil];
        trackingArea = [[NSTrackingArea alloc] initWithRect:buttonRect
                                          options:options
                                            owner:self
                                         userInfo:userInfo];
        [self.menuView addTrackingArea:trackingArea];
        
        [self.menuView addSubview:button];
    }
    
    self.myMenuItem.view = self.menuView;
    [self.attachedMenu addItem:self.myMenuItem];
    [self.attachedMenu addItem:otherMenu];
}

- (IBAction)showMenu:(id)sender {
    NSRect frame = [(NSButton *)sender frame];
    NSPoint menuOrigin = [[(NSButton *)sender superview] convertPoint:NSMakePoint(frame.origin.x, frame.origin.y) toView:nil];
    
    NSEvent *event =  [NSEvent mouseEventWithType:NSLeftMouseDown
                                         location:menuOrigin
                                    modifierFlags:NSLeftMouseDownMask
                                        timestamp:0
                                     windowNumber:[[(NSButton *)sender window] windowNumber]
                                          context:[[(NSButton *)sender window] graphicsContext]
                                      eventNumber:0
                                       clickCount:1
                                         pressure:1];
    
    [NSMenu popUpContextMenu:self.attachedMenu withEvent:event forView:(NSButton *)sender];
}

- (void)doSomething:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^(){
        [[NSAlert alertWithMessageText:@"Custom my avatar" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Implement customize avatar here..."] runModal];
    });
}

- (void)buttonClicked:(id)sender {
    [self.attachedMenu cancelTracking];
    
    dispatch_async(dispatch_get_main_queue(), ^(){
        [[NSAlert alertWithMessageText:@"Button Clicked" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"Button %d is clicked.", ([sender tag]+1)] runModal];
    });
}

- (void)mouseEntered:(NSEvent *)theEvent {
    NSButton *currentButton = [(NSDictionary *)[theEvent userData] objectForKey:@"button"];
    [currentButton setState:NSOnState];
}

- (void)mouseExited:(NSEvent *)theEvent {
    NSButton *currentButton = [(NSDictionary *)[theEvent userData] objectForKey:@"button"];
    [currentButton setState:NSOffState];
}

@end
