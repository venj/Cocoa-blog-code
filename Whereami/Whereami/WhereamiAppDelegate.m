//
//  WhereamiAppDelegate.m
//  Whereami
//
//  Created by Chu Venj on 11-6-3.
//  Copyright 2011年 Home. All rights reserved.
//

#import "WhereamiAppDelegate.h"
#import "MapPoint.h"

@implementation WhereamiAppDelegate

#pragma mark - Property Synthesizes

@synthesize window = _window;
@synthesize mapView = _mapView;
@synthesize locationTextField = _locationTextField;
@synthesize activityIndicator = _activityIndicator;
@synthesize mapTypeButton = _mapTypeButton;

#pragma mark - App Delegates & Dealloc

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    [_locationManager setDistanceFilter:kCLDistanceFilterNone];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //[_locationManager startUpdatingLocation];
    [_locationManager setPurpose:@"I want to watch you moving, will you agree?"];
    [self.mapView setShowsUserLocation:YES];
    [_locationTextField setDelegate:self];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_locationManager setDelegate:nil];
    [_locationManager release];
    [_window release];
    [_mapView release];
    [_locationTextField release];
    [_activityIndicator release];
    [_mapTypeButton release];
    [super dealloc];
}

# pragma mark - Methods

- (void)findLocation:(NSString *)locationString {
    CLGeocoder *geoCoder = [CLGeocoder new];
    [geoCoder geocodeAddressString:locationString completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@", [error description]);
            return;
        }
        else {
            CLPlacemark *m = [placemarks objectAtIndex:0];
            NSString *locationName = (([m name] == nil) ? locationString : [m name]);
            MapPoint *mp = [[MapPoint alloc] initWithCoordinate:[[m location] coordinate] title:locationName];
            [_mapView addAnnotation:mp];
            [mp release];
            [_mapView setCenterCoordinate:[[m location] coordinate] animated:YES];
            [self foundLocation];
        }
    }];
    
    [_locationManager startUpdatingLocation];
    [_activityIndicator startAnimating];
    [_locationTextField setHidden:YES];
}

- (void)foundLocation {
    [_locationTextField setText:@""];
    [_activityIndicator stopAnimating];
    [_locationTextField setHidden:NO];
    [_locationManager stopUpdatingLocation];
}

- (IBAction)segmentChanged:(id)sender {
    switch ([self.mapTypeButton selectedSegmentIndex]) {
        case 1:
            [_mapView setMapType:MKMapTypeSatellite];
            break;
        case 2:
            [_mapView setMapType:MKMapTypeHybrid];
            break;
        case 0:
        default:
            [_mapView setMapType:MKMapTypeStandard];
            break;
    }
}

# pragma mark - CLLocationManager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error: %@", error);
}

# pragma mark - MKMapView Delegate

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> mp = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 250., 250.);
    [_mapView setRegion:region animated:YES];
}

# pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)tf {
    [self findLocation:[tf text]];
    [tf resignFirstResponder];
    return YES;
}



@end
