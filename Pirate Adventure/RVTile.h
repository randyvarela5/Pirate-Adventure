//
//  RVTile.h
//  Pirate Adventure
//
//  Created by Randy Varela on 3/18/14.
//  Copyright (c) 2014 Randy Varela. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVWeapon.h"
#import "RVArmor.h"

@interface RVTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) RVWeapon* weapon;
@property (strong, nonatomic) RVArmor* armor;
@property (nonatomic) int healthEffect;

@end
