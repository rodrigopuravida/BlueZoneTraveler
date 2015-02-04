//
//  MapViewController.m
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "Stack.h"
#import "Queue.h"
#import <CoreLocation/CoreLocation.h>
#import "AddReminderDetailViewController.h"

@interface MapViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation MapViewController

//we are only doing this because we have custom setter and getter for this property


//MARK: BLUE ZONE BUTTONS =================================================
//TODO: Combine all 3 methods into one

- (IBAction)blueZone1Pressed:(id)sender {
    
    NSLog(@"Blue Zone1 clicked");
    
    self.mapView.mapType = MKMapTypeHybrid;
    
    //Okinawa, Japan
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    
    CLLocationCoordinate2D coord = {.latitude =  26.5000, .longitude =  128.0000};
    point.coordinate = coord;
    [self.mapView addAnnotation:point];
    MKCoordinateSpan span = {.latitudeDelta =  0.8, .longitudeDelta =  0.8};
    
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region animated:YES];
    
    [self.view addSubview:self.mapView];

}


- (IBAction)blueZone2Pressed:(id)sender {
    
    NSLog(@"Blue Zone2 clicked");
    self.mapView.mapType = MKMapTypeHybrid;
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    //Sardinia Italy
    CLLocationCoordinate2D coord = {.latitude =  40.0000, .longitude =  9.0000};
    
    point.coordinate = coord;
    [self.mapView addAnnotation:point];
    
    MKCoordinateSpan span = {.latitudeDelta =  0.8, .longitudeDelta =  0.8};
    
    
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region animated:YES];
    
    [self.view addSubview:self.mapView];

}

- (IBAction)blueZone3Pressed:(id)sender {
    
    NSLog(@"Blue Zone3 clicked");
    self.mapView.mapType = MKMapTypeHybrid;
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    //Hojancha, Costa Rica
    CLLocationCoordinate2D coord = {.latitude =  10.1503800, .longitude =  -85.4509300};
    
    point.coordinate = coord;
    [self.mapView addAnnotation:point];
    
    
    MKCoordinateSpan span = {.latitudeDelta =  0.8, .longitudeDelta =  0.8};
    
    
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region animated:YES];
    
    [self.view addSubview:self.mapView];
    
    //MARK: END BLUE ZONE BUTTONS =================================================

}
    //MARK: VIEWDIDLOAD ===========================================================

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //Core Location Area
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.mapView.delegate = self;
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        NSLog(@"current status is %d", [CLLocationManager authorizationStatus]);
        
        if ([CLLocationManager authorizationStatus] == 0) {
            [self.locationManager requestAlwaysAuthorization];
            
        } else {
            self.mapView.showsUserLocation = true;
            [self.locationManager startUpdatingLocation];
            //[self.locationManager startMonitoringSignificantLocationChanges];
        }
    } else {
        //warn the user that location services are not currently enabled
    }
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(mapLongPressed:)];
    
    [self.mapView addGestureRecognizer:longPress];
    
    
   
    
    //MARK: STACK CASES =================================================
    //Stack cases here
    NSLog(@"STACK Tests");
    Stack *s1 = [[Stack alloc] init];
    assert([s1 size]==0);
    assert([s1 isEmpty]==YES);
    NSLog(@"first set of tests passed");
    [s1 push:[NSNumber numberWithInt:0]];
    [s1 push:[NSNumber numberWithInt:3]];
    [s1 push:[NSNumber numberWithInt:5]];
    assert(![s1 isEmpty]);
    assert(s1.size == 3);
    assert([[s1 peek] isEqual:[NSNumber numberWithInt:5]]);
    assert([[s1 pop] isEqual:[NSNumber numberWithInt:5]]);
    assert(s1.size == 2);
    assert([[s1 pop] isEqual:[NSNumber numberWithInt:3]]);
    assert(![[s1 pop] isEqual:[NSNumber numberWithInt:3]]);
    assert([s1 pop] == nil);
    assert(s1.isEmpty);
    NSLog(@"second set of tests passed");

    
    //MARK: QUEUE CASES =================================================
    //Call the Queue stuff here
    
    NSLog(@"QUEUE Tests");
    
    Queue *s2 = [[Queue alloc] init];
    assert([s2 size]==0);
    //assert([s2 isEmpty]==YES);
    NSLog(@"first set of tests passed");
    [s2 enqueue:[NSNumber numberWithInt:0]];
    [s2 enqueue:[NSNumber numberWithInt:3]];
    [s2 enqueue:[NSNumber numberWithInt:5]];
    assert(![s2 isEmpty]);
    assert(s2.size == 3);
    assert([[s2 peek] isEqual:[NSNumber numberWithInt:0]]);
    assert([[s2 dequeue] isEqual:[NSNumber numberWithInt:0]]);
    assert(s2.size == 2);
    assert([[s2 dequeue] isEqual:[NSNumber numberWithInt:3]]);
    assert(![[s2 dequeue] isEqual:[NSNumber numberWithInt:3]]);
    assert(s2.isEmpty);
    NSLog(@"second set of tests passed");
  
}

    //MARK: END VIEWDIDLOAD

-(void)mapLongPressed:(id)sender {
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    NSLog(@"long press fired");
    if (longPress.state == 3 ) {
        NSLog(@"long press ended");
        CGPoint location = [longPress locationInView:self.mapView];
        NSLog(@"location y: %f location x: %f",location.y, location.x);
        CLLocationCoordinate2D coordinates = [self.mapView convertPoint:location toCoordinateFromView:self.mapView];
        NSLog(@"coordinate long: %f coordinate lat x: %f",coordinates.longitude, coordinates.latitude);
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = coordinates;
        annotation.title = @"New Blue Zone?";
        [self.mapView addAnnotation:annotation];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@" the new status is %d", status);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = locations.firstObject;
    NSLog(@"latitide: %f and longitude: %f",location.coordinate.latitude, location.coordinate.longitude);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];
    NSLog(@"Error: %@",error.description);
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
    annotationView.animatesDrop = true;
    annotationView.pinColor = MKPinAnnotationColorPurple;
    annotationView.canShowCallout = true;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    MKPointAnnotation *annotation = view.annotation;
    
    //[self performSegueWithIdentifier:@"SHOW_DETAIL" sender:self];
    
    //Since we are not using segue identifier and is in storyboard need to instantiate with Identifier
    //AddReminderDetailViewController *reminderController = [[AddReminderDetailViewController alloc] init];
    AddReminderDetailViewController *reminderController = [self.storyboard instantiateViewControllerWithIdentifier:@"REMINDER"];
    reminderController.annotation = annotation;
    NSLog(@"latitude: %f and longitude: %f to be passed to next controller", reminderController.annotation.coordinate.latitude, reminderController.annotation.coordinate.longitude);
        
    [self presentViewController:reminderController animated:YES completion:nil];
   
    NSLog(@"button tapped");
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    //This I don't need
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"SHOW_DETAIL"]) {
//        MapViewController *transferViewController = segue.destinationViewController;
//        AddReminderDetailViewController *destViewController = segue.destinationViewController;
//        destViewController.annotation = self.mapView.annotations[0];
//    }
}




@end


