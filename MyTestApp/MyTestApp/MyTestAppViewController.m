//
//  MyTestAppViewController.m
//  MyTestApp
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import "MyTestAppViewController.h"

@implementation MyTestAppViewController
@synthesize numberA;
@synthesize numberB;
@synthesize resultLabel;
@synthesize mySillyAdd;

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
    
    mySillyAdd = [[MySillyAdd alloc] init];
}


- (void)viewDidUnload
{
    [self setNumberA:nil];
    [self setNumberB:nil];
    [self setResultLabel:nil];
    [self setMySillyAdd:nil];
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
    [numberA release];
    [numberB release];
    [resultLabel release];
    [mySillyAdd release];
    [super dealloc];
}

- (IBAction)calc:(id)sender {
    NSInteger a = [self.numberA.text integerValue];
    NSInteger b = [self.numberB.text integerValue];
    
    self.resultLabel.text = [NSString stringWithFormat:@"%d", [mySillyAdd addNumberA:a ToNumberB:b]];
}


@end
