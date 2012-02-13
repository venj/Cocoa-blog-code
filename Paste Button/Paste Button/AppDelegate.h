//
//  AppDelegate.h
//  Paste Button
//
//  Created by 朱 文杰 on 12-2-13.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *sourceField;
@property (assign) IBOutlet NSTextField *targetField;
- (IBAction)copyText:(id)sender;
- (IBAction)pasteText:(id)sender;

@end
