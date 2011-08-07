//
//  RTF2HTMLAppDelegate.m
//  RTF2HTML
//
//  Created by Chu Venj on 11-4-22.
//  Copyright 2011年 Home. All rights reserved.
//

#import "RTF2HTMLAppDelegate.h"

@implementation RTF2HTMLAppDelegate

@synthesize window;
@synthesize richView;
@synthesize htmlView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)convert:(id)sender {
    attrString = [richView attributedString];
    NSMutableArray *exclude = [NSMutableArray array];
    [exclude addObject:@"XML"];
    [exclude addObjectsFromArray:[NSArray arrayWithObjects:@"APPLET", @"BASEFONT", @"CENTER", @"DIR", @"FONT", @"ISINDEX", @"MENU", @"S", @"STRIKE", @"U", nil]];
    [exclude addObject:@"STYLE"];
    //[exclude addObject:@"SPAN"];
    //[exclude addObject:@"Apple-converted-space"];
    //[exclude addObject:@"Apple-converted-tab"];
    //[exclude addObject:@"Apple-interchange-newline"];
    //[exclude addObjectsFromArray:[NSArray arrayWithObjects:@"doctype", @"html", @"head", @"body", nil]];
    
    NSDictionary *htmlAtt = [NSDictionary dictionaryWithObjectsAndKeys:
                             NSHTMLTextDocumentType, NSDocumentTypeDocumentAttribute,
                             exclude, NSExcludedElementsDocumentAttribute, nil];
    NSError *error;
    NSData *htmlData = [attrString dataFromRange:NSMakeRange(0,[attrString length]) documentAttributes:htmlAtt error:&error ];
    NSString *htmlString = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
    [htmlView setStringValue:htmlString];
    NSLog(@"%@",htmlString);
}
@end
