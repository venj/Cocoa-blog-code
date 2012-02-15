//
//  AppDelegate.m
//  TwiTable
//
//  Created by 朱 文杰 on 12-2-15.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "AppDelegate.h"

static NSString *arr[] = {@"This is just an example 1.", 
    @"This is just an example 2.", @"This is just an example 3.", 
    @"This is just an example 4.", @"This is just an example 5.", 
    @"This is just an example 6.", @"This is just an example 7.", 
    @"This is just an example 8.", @"This is just an example 9.", 
    @"This is just an example 10.", @"This is just an example 11.", 
    @"This is just an example 12.", @"This is just an example 13.", 
    @"This is just an example 14.", @"This is just an example 15.", 
    @"This is just an example 16.", @"This is just an example 17.", 
    @"This is just an example 18.", @"This is just an example 19.", 
    @"This is just an example 20.", @"This is just an example 21.", 
    @"This is just an example 22."};

@implementation AppDelegate

@synthesize window = _window;
@synthesize tableView = _tableView;
@synthesize values = _values;

- (void)dealloc
{
    [_values release];
    [super dealloc];
}

- (void)awakeFromNib {
    if (!self.values) {
        self.values = [NSMutableArray array];
        for (NSInteger i; i < 22; ++i) {
            [self.values addObject:arr[i]];
        }
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)removeRow:(id)sender {
    NSAlert *alert = [NSAlert alertWithMessageText:@"Are you sure?" defaultButton:@"Yes" alternateButton:@"No" otherButton:nil informativeTextWithFormat:@"Deleting a table cell is not reversable."];
    [alert beginSheetModalForWindow:self.window modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:NULL];
}

- (void)alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    if (returnCode == NSAlertDefaultReturn) {
        [[self.tableView selectedRowIndexes] enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop){
            [self.values removeObjectAtIndex:idx];
        }];
        
        [self.tableView removeRowsAtIndexes:[self.tableView selectedRowIndexes] withAnimation:NSTableViewAnimationSlideUp];
    }
}

- (NSRect)window:(NSWindow *)window willPositionSheet:(NSWindow *)sheet usingRect:(NSRect)rect {
    // There are many ways to get the cellRect.
    // Solution 1: 
    // id cell = [self.tableView rowViewAtRow:[self.tableView selectedRow] makeIfNecessary:YES];
    // NSRect cellRect = [cell frame];
    // 
    // Solution 2: (A little different to other two. See doc for detail. Not recommended.)
    // NSRect cellRect = [self.tableView frameOfCellAtColumn:[self.tableView selectedColumn] row:[self.tableView selectedRow]];
    // 
    // Solution 3: (Recommend!)
    NSRect cellRect = [self.tableView rectOfRow:[self.tableView selectedRow]];
    
    NSRect scrollViewRect = [self.tableView.superview frame];
    cellRect.origin.y = scrollViewRect.size.height - cellRect.origin.y; // View based table view is flipped.
    cellRect.size.height = 0;
    return cellRect;
}

#pragma mark Pop up table view

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView {
    return [self.values count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTableCellView *cellView = [self.tableView makeViewWithIdentifier:@"MyView" owner:self];
    cellView.textField.stringValue = [self.values objectAtIndex:row];
    return cellView;
}

@end
