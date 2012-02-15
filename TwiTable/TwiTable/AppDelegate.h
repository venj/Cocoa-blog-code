//
//  AppDelegate.h
//  TwiTable
//
//  Created by 朱 文杰 on 12-2-15.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource, NSWindowDelegate>

@property (retain, nonatomic) NSMutableArray *values; 
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTableView *tableView;

- (IBAction)removeRow:(id)sender;
@end
