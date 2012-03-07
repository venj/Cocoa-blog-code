//
//  AppDelegate.h
//  Growl Test
//
//  Created by 朱 文杰 on 12-3-7.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Growl/Growl.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, GrowlApplicationBridgeDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)postGrowl:(id)sender;

@end
