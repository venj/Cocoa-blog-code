//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by Chu Venj on 11-6-3.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, 
                                           MKMapViewDelegate, UITextFieldDelegate> 
{
    @private
    CLLocationManager *_locationManager;
    MKMapView *_mapView;
    UITextField *_locationTextField;
    UIActivityIndicatorView *_activityIndicator;
    UISegmentedControl *_mapTypeButton;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UITextField *locationTextField;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) IBOutlet UISegmentedControl *mapTypeButton;

- (void)findLocation:(NSString *)locationString;
- (void)foundLocation;
- (IBAction)segmentChanged:(id)sender;

@end
