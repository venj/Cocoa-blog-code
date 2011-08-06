//
//  SearchViewController.h
//  WikiView
//
//  Created by Venj Chu on 11/08/05.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;
@interface SearchViewController : UIViewController {
    UITextField *searchTermField;
    WebViewController *webViewController;
}

@property (nonatomic, retain) IBOutlet UITextField *searchTermField;
@property (nonatomic, retain) IBOutlet WebViewController *webViewController;

- (IBAction)searchWiki:(id)sender;
@end
