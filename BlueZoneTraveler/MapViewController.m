//
//  MapViewController.m
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController
//TODO: Combine all 3 methods into one

- (IBAction)blueZone1Pressed:(id)sender {
    
    NSLog(@"Blue Zone1 clicked");
    
    self.mapView.mapType = MKMapTypeHybrid;
    
    //Okinawa, Japan
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    
    CLLocationCoordinate2D coord = {.latitude =  26.5000, .longitude =  128.0000};
    point.coordinate = coord;
    [self.mapView addAnnotation:point];
    MKCoordinateSpan span = {.latitudeDelta =  0.5, .longitudeDelta =  0.5};
    
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region animated:YES];
    

    
    //[self.mapView setRegion:region];
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
    
    MKCoordinateSpan span = {.latitudeDelta =  0.5, .longitudeDelta =  0.5};
    
    
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region animated:YES];
    
    
    
    //[self.mapView setRegion:region];
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
    
    
    MKCoordinateSpan span = {.latitudeDelta =  0.5, .longitudeDelta =  0.5};
    
    
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region animated:YES];
    
    
    
    //[self.mapView setRegion:region];
    [self.view addSubview:self.mapView];

}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
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
