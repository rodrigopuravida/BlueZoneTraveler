//
//  InterfaceController.m
//  BlueZoneTraveler WatchKit Extension
//
//  Created by Rodrigo Carballo on 2/5/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "InterfaceController.h"
#import "ReminderRowController.h"
#import <CoreLocation/CoreLocation.h>


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceTable *table;

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    CLLocationManager *locationManager = [CLLocationManager new];
    NSSet *regions = locationManager.monitoredRegions;
    NSArray *regionsArray = regions.allObjects;
    
    [self.table setNumberOfRows:regionsArray.count withRowType:@"ReminderRowController"];
    NSInteger index = 0;
    for (CLCircularRegion *item in regionsArray) {
        ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
        [rowController.reminderLabel setText:item.identifier];
        NSLog(item.identifier);
        index++;
    }
    
    
//    for (NSString *item in regionsArray) {
//        NSLog(item.description);
//
//    }

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



