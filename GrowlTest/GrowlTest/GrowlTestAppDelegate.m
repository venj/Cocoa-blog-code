//
//  GrowlTestAppDelegate.m
//  GrowlTest
//
//  Created by Chu Venj on 11-5-26.
//  Copyright 2011年 Home. All rights reserved.
//

#import "GrowlTestAppDelegate.h"

@implementation GrowlTestAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [GrowlApplicationBridge setGrowlDelegate:self];
    if (![GrowlApplicationBridge isGrowlInstalled]) {
        NSLog(@"not installed");
    }
}

- (IBAction)showGrowl:(id)sender {
    [GrowlApplicationBridge notifyWithTitle:@"The Title" description:@"This is a notification description." notificationName:@"myNote" iconData:nil priority:0 isSticky:NO clickContext:@"God"];
}

# pragma mark - Growl Delegate

//- (NSDictionary *)registrationDictionaryForGrowl {
//    NSArray *allNotes = [NSArray arrayWithObjects:@"myNotification", @"myNote", @"notDefaultNote", nil];
//    NSArray *defaultNotes = [NSArray arrayWithObjects:@"myNotification", @"myNote", nil];
//    
//    return [NSDictionary dictionaryWithObjectsAndKeys:allNotes, GROWL_NOTIFICATIONS_ALL, defaultNotes, GROWL_NOTIFICATIONS_DEFAULT, nil];
//}

- (void) growlIsReady {
    NSLog(@"Growl is up and running.");
    [self showGrowl:nil];
}

- (void) growlNotificationTimedOut:(id)clickContext {
    NSLog(@"%@, I'm disappearing...", clickContext);
}

- (void) growlNotificationWasClicked:(id)clickContext {
    NSLog(@"%@, I'm clicked...", clickContext);
}

- (NSData *) applicationIconDataForGrowl {
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForImageResource:@"lame"]];
    return data;
}

- (NSString *) applicationNameForGrowl {
    return @"GrowlAppTest";
}

# pragma mark - Growl Installer Delegate

- (NSString *)growlInstallationWindowTitle {
    return @"Install Growl";
}

- (NSString *)growlUpdateWindowTitle {
    return @"Update Growl";
}

//- (NSAttributedString *)growlInstallationInformation {
//    // Some inplementation
//}
//
//- (NSAttributedString *)growlUpdateInformation {
//    // Some inplementation
//}

@end
