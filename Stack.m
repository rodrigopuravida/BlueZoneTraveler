//
//  Stack.m
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "Stack.h"

@implementation Stack {
    NSMutableArray *stack;
}

-(id)init{
    self = [super init];
    if(self!=nil){
        stack = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)push:(id)obj{
    [stack addObject:obj];
}

-(id)pop{
    id lastObj = [stack lastObject];
    [stack removeLastObject];
    return lastObj;
}

-(NSUInteger)size{
    return stack.count;
}

-(id)peek{
    return [[stack lastObject] copy];
}

-(BOOL)isEmpty{
    return stack.count == 0;
}

@end
