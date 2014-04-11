//
//  RVFactory.h
//  Pirate Adventure
//
//  Created by Randy Varela on 3/18/14.
//  Copyright (c) 2014 Randy Varela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVCharacter.h"
#import "RVBoss.h"

@interface RVFactory : NSObject

-(NSArray *)tiles;
-(RVCharacter *)character;
-(RVBoss *)boss;

@end
