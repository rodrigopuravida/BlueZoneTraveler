//
//  MiniMapInterfaceController.m
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/5/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "MiniMapInterfaceController.h"


@interface MiniMapInterfaceController()

@end


@implementation MiniMapInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    self.region = context;
    
    //miniMap
    MKCoordinateRegion region = MKCoordinateRegionMake(self.region.center, MKCoordinateSpanMake(0.6, 0.6));
    [self.miniMap setRegion:region];
    
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



