//
//  WebViewController.h
//  WikiView
//
//  Created by Venj Chu on 11/08/05.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate> {
    UINavigationBar *navBar;
    UIWebView *webView;
    UIActivityIndicatorView *activeIndicator;
    UIBarButtonItem *barButton;
    UIView *maskView;
    UIView *bgView;
}


@property (nonatomic, retain) IBOutlet UIBarButtonItem *barButton;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activeIndicator;

- (IBAction)dismissWebView:(id)sender;
- (void)loadWikiEntry:(NSString *)entry;
@end
