//
//  AddReminderDetailViewController.m
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/3/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "AddReminderDetailViewController.h"

@interface AddReminderDetailViewController ()

@end

@implementation AddReminderDetailViewController

//@synthesize annotation;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"I'm at AddReminderDetailViewController");
    NSLog(@"latitude: %f and longitude: %f received from MapView Controller", self.annotation.coordinate.latitude, self.annotation.coordinate.longitude);
    
}
- (IBAction)pressedAddReminderButton:(id)sender {
    
    if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:200 identifier:@"Reminder"];
        [self.locationManager startMonitoringForRegion:region];
        // NSDictionary *userInfo = @{@"reminder" : region};
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : region}];        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end