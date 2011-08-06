//
//  WikiViewAppDelegate.h
//  WikiView
//
//  Created by Venj Chu on 11/08/05.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchViewController;
@interface WikiViewAppDelegate : NSObject <UIApplicationDelegate> {
    SearchViewController *_searchView;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SearchViewController *searchView;

@end
