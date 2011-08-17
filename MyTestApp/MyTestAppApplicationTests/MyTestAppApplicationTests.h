//
//  MyTestAppApplicationTests.h
//  MyTestAppApplicationTests
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "MyTestAppViewController.h"
#import "MyTestAppAppDelegate.h"

@interface MyTestAppApplicationTests : SenTestCase {
    MyTestAppViewController *vc;
    MyTestAppAppDelegate *appDelegate;
    UIView *view;
}

- (void)testAddOneToOne;

@end
