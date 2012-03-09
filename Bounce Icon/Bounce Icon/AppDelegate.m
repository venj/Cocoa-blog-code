//
//  AppDelegate.m
//  Bounce Icon
//
//  Created by 朱 文杰 on 12-3-1.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)buttonOnceClicked:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bounceOnce:) userInfo:nil repeats:NO];
}

- (IBAction)buttonAlwaysClicked:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(bounceAlways:) userInfo:nil repeats:NO];
}

- (void)bounceOnce:(id)sender {
    [NSApp requestUserAttention:NSInformationalRequest];
}

- (void)bounceAlways:(id)sender {
    [NSApp requestUserAttention:NSCriticalRequest];
}

@end
