//
//  FileExchangeViewController.m
//  FileExchange
//
//  Created by Venj Chu on 11/08/07.
//  Copyright 2011年 Home. All rights reserved.
//

#import "FileExchangeViewController.h"

@implementation FileExchangeViewController
@synthesize statusMessage;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"%@", NSHomeDirectory());
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *dbPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"db.sqlite"];
    
    if ([manager fileExistsAtPath:dbPath]) {
        self.statusMessage.text = @"Ready To Go";
    }
    else {
        self.statusMessage.text = @"No DB File";
    }
}


- (void)viewDidUnload
{
    [self setStatusMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [statusMessage release];
    [super dealloc];
}
@end
