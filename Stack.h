//
//  Stack.h
//  BlueZoneTraveler
//
//  Created by Rodrigo Carballo on 2/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

-(void)push:(id)obj;
-(id)pop;
-(NSUInteger)size;
-(id)peek;
-(BOOL)isEmpty;

@end
