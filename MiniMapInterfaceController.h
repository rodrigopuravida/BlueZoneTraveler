//
//  MiniMapInterfaceController.h
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/5/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface MiniMapInterfaceController : WKInterfaceController

@property (strong, nonatomic) CLCircularRegion *region;
@property (weak, nonatomic) IBOutlet WKInterfaceMap *miniMap;


@end
