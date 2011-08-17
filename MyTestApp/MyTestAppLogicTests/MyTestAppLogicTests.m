//
//  MyTestAppLogicTests.m
//  MyTestAppLogicTests
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import "MyTestAppLogicTests.h"

@implementation MyTestAppLogicTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    mySillyAdd = [[MySillyAdd alloc] init];
    STAssertNotNil(mySillyAdd, @"Can not create MySillyAdd object.");
}

- (void)tearDown
{
    // Tear-down code here.
    [mySillyAdd release];
    
    [super tearDown];
}

- (void)testAddOneToOne {
    NSInteger result = [mySillyAdd addNumberA:1 ToNumberB:1];
    STAssertEquals(2, 2, @"Expect 2 for result, but got %d", result);
}


@end
