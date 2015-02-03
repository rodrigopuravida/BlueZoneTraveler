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

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

//we are only doing this because we have custom setter and getter for this property


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

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
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

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

//- (void)dealloc {
//    
//    [super dealloc];
//    
//}


@end


