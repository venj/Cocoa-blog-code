//
//  MyTestAppApplicationTests.m
//  MyTestAppApplicationTests
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import "MyTestAppApplicationTests.h"

@implementation MyTestAppApplicationTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    appDelegate    = [[UIApplication sharedApplication] delegate];
    vc = (MyTestAppViewController *)appDelegate.window.rootViewController;
    view = vc.view;
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testAppDelegate {
    STAssertNotNil(appDelegate, @"Cannot find the application delegate");
}

- (void)testAddOneToOne {
    vc.numberA.text = @"1";
    vc.numberB.text = @"1";
    
    [vc calc:[view viewWithTag:3]]; // The Tag Button;
    
    NSString *resultString = vc.resultLabel.text;
    
    STAssertEqualObjects(@"2", resultString, @"Expect 2 for result, but got %@", resultString);
}


@end
