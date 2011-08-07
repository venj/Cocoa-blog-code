//
//  GrowlTestAppDelegate.h
//  GrowlTest
//
//  Created by Chu Venj on 11-5-26.
//  Copyright 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Growl-WithInstaller/Growl.h"

@interface GrowlTestAppDelegate : NSObject <NSApplicationDelegate, GrowlApplicationBridgeDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;
- (IBAction)showGrowl:(id)sender;

@end
