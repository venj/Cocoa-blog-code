//
//  FileExchangeAppDelegate.h
//  FileExchange
//
//  Created by Venj Chu on 11/08/07.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FileExchangeViewController;

@interface FileExchangeAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FileExchangeViewController *viewController;

@end
