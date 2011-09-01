//
//  AppDelegate.m
//  Screen Grab
//
//  Created by Venj Chu on 11/09/01.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize imageView = _imageView;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

-(BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

- (IBAction)grabScreen:(id)sender {
    NSTask *capture = [[[NSTask alloc] init] autorelease];
    capture.launchPath = @"/usr/sbin/screencapture";
    capture.arguments = [NSArray arrayWithObjects:@"-i", @"-c", nil];
    
    [capture setTerminationHandler: ^(NSTask *t) {
        NSPasteboard *pboard = [NSPasteboard generalPasteboard];
        NSPasteboardItem *pboardItem = [[pboard pasteboardItems] objectAtIndex:0];
        NSString *pboardItemType = [[pboard types] objectAtIndex:0];
        NSData *imageData = [pboardItem dataForType:pboardItemType];
        NSImage *image = [[NSImage alloc] initWithData:imageData];
        [self.imageView setImage:image];
        [image release];
    }];
    
    [capture launch];
}

@end
