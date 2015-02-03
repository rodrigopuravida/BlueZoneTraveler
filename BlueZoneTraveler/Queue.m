//
//  Queue.m
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "Queue.h"

@implementation Queue {
     NSMutableArray *queue;

}

-(id)init{
    self = [super init];
    if(self!=nil){
        queue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) dequeue {

    id headObject = [queue objectAtIndex:0];
    if (headObject != nil) {
        [queue removeObjectAtIndex:0];
    }
    return headObject;
}


- (void) enqueue:(id)anObject {
    [queue addObject:anObject];
}

-(NSUInteger)size{
    return queue.count;
}

-(id)peek{
    return [[queue firstObject] copy];
}

-(BOOL)isEmpty{
    return queue.count == 0;
}

@end
