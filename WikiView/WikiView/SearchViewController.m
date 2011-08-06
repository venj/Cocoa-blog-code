//
//  SearchViewController.m
//  WikiView
//
//  Created by Venj Chu on 11/08/05.
//  Copyright 2011年 Home. All rights reserved.
//

#import "SearchViewController.h"
#import "WebViewController.h"

@implementation SearchViewController
@synthesize searchTermField;
@synthesize webViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setSearchTermField:nil];
    [self setWebViewController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)searchWiki:(id)sender {
    [self.searchTermField resignFirstResponder];
    [self presentModalViewController:self.webViewController animated:YES];
    [self.webViewController loadWikiEntry: self.searchTermField.text];
}

- (void)dealloc {
    [searchTermField release];
    [webViewController release];
    [super dealloc];
}
@end
