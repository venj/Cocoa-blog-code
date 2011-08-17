//
//  MyTestAppAppDelegate.h
//  MyTestApp
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTestAppViewController;

@interface MyTestAppAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MyTestAppViewController *viewController;

@end
