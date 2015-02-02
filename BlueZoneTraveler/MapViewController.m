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


- (IBAction)blueZone1Pressed:(id)sender {
    
    NSLog(@"Blue Zone1 clicked");
    
    self.mapView.mapType = MKMapTypeHybrid;
    
    CLLocationCoordinate2D coord = {.latitude =  61.2180556, .longitude =  -149.9002778};
    MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
    MKCoordinateRegion region = {coord, span};
    
    [self.mapView setRegion:region];
    [self.view addSubview:self.mapView];

   
    
}


- (IBAction)blueZone2Pressed:(id)sender {
    
    NSLog(@"Blue Zone2 clicked");
}

- (IBAction)blueZone3Pressed:(id)sender {
    
    NSLog(@"Blue Zone3 clicked");
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    mapView = [[MKMapView alloc] initWithFrame:self.view.frame];
//    mapView.mapType = MKMapTypeHybrid;
//    
//    CLLocationCoordinate2D coord = {.latitude =  61.2180556, .longitude =  -149.9002778};
//    MKCoordinateSpan span = {.latitudeDelta =  0.2, .longitudeDelta =  0.2};
//    MKCoordinateRegion region = {coord, span};
//    
//    [mapView setRegion:region];
//    [self.view addSubview:mapView];
    
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
