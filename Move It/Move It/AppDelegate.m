//
//  AppDelegate.m
//  Move It
//
//  Created by Venj Chu on 11/09/10.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import "AppDelegate.h"
#import "PFMoveApplication.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    PFMoveToApplicationsFolderIfNecessary();
}

@end
