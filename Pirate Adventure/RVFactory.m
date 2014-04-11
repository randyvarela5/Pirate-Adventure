//
//  RVFactory.m
//  Pirate Adventure
//
//  Created by Randy Varela on 3/18/14.
//  Copyright (c) 2014 Randy Varela. All rights reserved.
//

#import "RVFactory.h"
#import "RVTile.h"

@implementation RVFactory

-(NSArray *)tiles
{
    RVTile *tile1 = [[RVTile alloc]init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake a voyage.  You just need to stop the pirate boss.  Would you like a blunted sword to get started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    RVWeapon* bluntedSword = [[RVWeapon alloc]init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damage = 12;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take the Sword!";
    
    
    RVTile *tile2 = [[RVTile alloc]init];
    tile2.story = @"You have come across an armory, would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    RVArmor* steelArmor = [[RVArmor alloc]init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take Armor";
    
    RVTile *tile3 = [[RVTile alloc]init];
    tile3.story = @"A mysterious dock appears on the horizon.  Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at the dock";
    
    
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc]init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    RVTile *tile4 = [[RVTile alloc]init];
    tile4.story = @"You have found a parrot.  This can be used in your armor slot.  Parrots are a great defender and are fiercly loyal to the captain";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    RVArmor* parrotArmor = [[RVArmor alloc]init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.actionButtonName = @"Adopt parrot";
    
    
    RVTile *tile5 = [[RVTile alloc]init];
    tile5.story = @"You have stumbled upon a cash of pirate weapons, would you like to upgrade to a pirate pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    RVWeapon* pistolWeapon = [[RVWeapon alloc]init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damage = 17;
    tile5.actionButtonName = @"Use Pistol";
    
    
    RVTile *tile6 = [[RVTile alloc]init];
    tile6.story = @"You have been captured by pirates and now you have to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Show no fear";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc]init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    RVTile *tile7 = [[RVTile alloc]init];
    tile7.story = @"You have cited a pirate battle off the coast, should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those scum";
    
    RVTile *tile8 = [[RVTile alloc]init];
    tile8.story = @"The legend of the deep.  The mighty Kraken appears!";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abandon ship!";
    
    RVTile *tile9 = [[RVTile alloc]init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasure";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take Treasure";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc]init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    RVTile *tile10 = [[RVTile alloc]init];
    tile10.story = @"A group of pirates attempts to board your ship!";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Repel the invaders";
    
    RVTile *tile11 = [[RVTile alloc]init];
    tile11.story = @"In the deep of the sea, many things live and many things can be found.  Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim deeper";
    
    RVTile *tile12 = [[RVTile alloc]init];
    tile12.story = @"Your final face off with the fearsome pirate boss!!!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight!";
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc]init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc]initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}

-(RVCharacter *)character
{
    RVCharacter* character = [[RVCharacter alloc]init];
    character.health = 100;
    RVArmor* armor = [[RVArmor alloc]init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    
    RVWeapon* weapon = [[RVWeapon alloc]init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;

    return character;
}

-(RVBoss *)boss
{
    RVBoss* boss = [[RVBoss alloc]init];
    boss.health = 65;
    return boss;
}






@end
