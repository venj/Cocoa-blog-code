//
//  AppDelegate.h
//  Bounce Icon
//
//  Created by 朱 文杰 on 12-3-1.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)buttonOnceClicked:(id)sender;
- (IBAction)buttonAlwaysClicked:(id)sender;

@end
