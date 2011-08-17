//
//  MySillyAdd.h
//  MyTestApp
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySillyAdd : NSObject
@property (assign) NSInteger numberA;
@property (assign) NSInteger numberB;

- (NSInteger)addNumberA:(NSInteger)theNumberA ToNumberB:(NSInteger)theNumberB;
@end
