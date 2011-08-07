//
//  MapPoint.m
//  Whereami
//
//  Created by Venj Chu on 11/07/06.
//  Copyright 2011 Home. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

@synthesize title = _title;
@synthesize coordinate = _coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t {
    if (([super init])) {
        _coordinate = c;
        self.title = t;
    }
    return self;
}

- (void)dealloc {
    [self.title release];
    
    [super dealloc];
}

@end
