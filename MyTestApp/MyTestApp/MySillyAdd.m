//
//  MySillyAdd.m
//  MyTestApp
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import "MySillyAdd.h"

@implementation MySillyAdd
@synthesize numberA = _numberA;
@synthesize numberB = _numberB;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSInteger)addNumberA:(NSInteger)theNumberA ToNumberB:(NSInteger)theNumberB {
    return theNumberA + theNumberB;
}

@end
