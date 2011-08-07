//
//  RTF2HTMLAppDelegate.h
//  RTF2HTML
//
//  Created by Chu Venj on 11-4-22.
//  Copyright 2011年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RTF2HTMLAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSTextView *richView;
    NSTextField *htmlView;
    NSAttributedString *attrString;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextView *richView;
@property (assign) IBOutlet NSTextField *htmlView;
- (IBAction)convert:(id)sender;

@end
