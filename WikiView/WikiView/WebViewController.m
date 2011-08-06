//
//  WebViewController.m
//  WikiView
//
//  Created by Venj Chu on 11/08/05.
//  Copyright 2011年 Home. All rights reserved.
//

#import "WebViewController.h"
#import "BezelsView.h"

@implementation WebViewController
@synthesize barButton;
@synthesize navBar;
@synthesize webView;
@synthesize activeIndicator;

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
    
    self.webView.delegate = self;
}

- (void)viewDidUnload
{
    [self setNavBar:nil];
    [self setBarButton:nil];
    [self setWebView:nil];
    [self setActiveIndicator:nil];
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
    [navBar release];
    [barButton release];
    [webView release];
    [activeIndicator release];
    [super dealloc];
}

- (IBAction)dismissWebView:(id)sender {
    [self.webView stopLoading];
    [self.webView loadHTMLString:@"" baseURL:nil];
    [self dismissModalViewControllerAnimated:YES];
}

- (void)loadWikiEntry:(NSString *)entry {
    NSString *searchString = [entry stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://ja.wikipedia.org/wiki/%@?&useFormat=mobile", searchString]]];
    [self.webView loadRequest:request];
    [request release];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    CGRect maskFrame;
    maskFrame = self.webView.frame;
    maskView = [[UIView alloc] initWithFrame:maskFrame];
    CGRect bgFrame;
    bgFrame.origin.x = (maskFrame.size.width / 2.0) - 50.0;
    bgFrame.origin.y = (maskFrame.size.height / 2.0) - 50.0;
    bgFrame.size.width = 100.0;
    bgFrame.size.height = 100.0;
    bgView = [[BezelsView alloc] initWithFrame:bgFrame];
    bgView.backgroundColor = [UIColor clearColor];
    
    CGRect activeIndicatorFrame;
    activeIndicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectZero];
    [activeIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [activeIndicator hidesWhenStopped];
    [activeIndicator sizeToFit];
    
    activeIndicatorFrame.origin.x = (bgFrame.size.width / 2.0) - activeIndicator.frame.size.width / 2.0;
    activeIndicatorFrame.origin.y = (bgFrame.size.height / 2.0) - activeIndicator.frame.size.height / 2.0;
    activeIndicatorFrame.size = activeIndicator.frame.size;
    
    [activeIndicator setFrame:activeIndicatorFrame];
    
    [maskView addSubview:bgView];
    [bgView addSubview:activeIndicator];
    [self.view addSubview:maskView];
    
    [activeIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [activeIndicator stopAnimating];
    [activeIndicator removeFromSuperview];
    [activeIndicator release];
    activeIndicator = nil;
    
    [bgView removeFromSuperview];
    [bgView release];
    bgView = nil;
    
    [maskView removeFromSuperview];
    [maskView release];
    maskView = nil;
}


@end
