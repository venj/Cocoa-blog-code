//
//  AppDelegate.m
//  Growl Test
//
//  Created by 朱 文杰 on 12-3-7.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [GrowlApplicationBridge setGrowlDelegate:self];
}

- (BOOL) hasNetworkClientEntitlement {
    return NO;
}

- (IBAction)postGrowl:(id)sender {
    [GrowlApplicationBridge
     notifyWithTitle:@"Sandboxed!"
     description:@"This notification is sent from a sandboxed app."
     notificationName:@"GTApplicationNotification"
     iconData:nil
     priority:0
     isSticky:YES
     clickContext:nil];
}
@end
