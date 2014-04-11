//
//  RVCharacter.h
//  Pirate Adventure
//
//  Created by Randy Varela on 3/25/14.
//  Copyright (c) 2014 Randy Varela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVArmor.h"
#import "RVWeapon.h"

@interface RVCharacter : NSObject

@property (strong, nonatomic) RVArmor* armor;
@property (strong, nonatomic) RVWeapon* weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;


@end
