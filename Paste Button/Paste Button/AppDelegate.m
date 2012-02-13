//
//  AppDelegate.m
//  Paste Button
//
//  Created by 朱 文杰 on 12-2-13.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize sourceField = _sourceField;
@synthesize targetField = _targetField;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)copyText:(id)sender {
    [self.sourceField becomeFirstResponder];
    NSText *sourceText = [self.window fieldEditor:YES forObject:self.sourceField];
    [sourceText selectAll:nil];
    [sourceText copy:nil];
}

- (IBAction)pasteText:(id)sender {
    [self.targetField becomeFirstResponder];
    NSText *targetText = [self.window fieldEditor:YES forObject:self.targetField];
    self.targetField.stringValue = @"";
    [targetText paste:nil];
}

@end
