//
//  MapPoint.h
//  Whereami
//
//  Created by Venj Chu on 11/07/06.
//  Copyright 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/Mapkit.h>

@interface MapPoint : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString * title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)title;

@end
