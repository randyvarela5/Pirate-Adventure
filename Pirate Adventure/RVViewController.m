//
//  RVViewController.m
//  Pirate Adventure
//
//  Created by Randy Varela on 3/18/14.
//  Copyright (c) 2014 Randy Varela. All rights reserved.
//

#import "RVViewController.h"
#import "RVFactory.h"
#import "RVTile.h"
#import "RVArmor.h"

@interface RVViewController ()

@end

@implementation RVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    RVFactory *factory = [[RVFactory alloc]init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile];
    [self updateButtons];
    
    
}

#pragma mark - IBAction


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    
    RVTile* tile = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    if (tile.healthEffect == -15) {
        self.boss.health= self.boss.health - self.character.damage;
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    
    
    if (self.character.health <= 0)
    {
        UIAlertView* alertView = [[[UIAlertView alloc]init] initWithTitle:@"Death Message" message:@"You have died, please restart the game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    else if (self.boss.health <= 0)
    {
        UIAlertView* alertView = [[[UIAlertView alloc]init] initWithTitle:@"Victory Message" message:@"You have defeated the eveil pirate boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    
    [self updateTile];
    
    
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
    
    
    
}

#pragma mark - helper methods


-(void)updateTile
{
    RVTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
}

    
    

-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x-1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)];
}


-(BOOL)tileExistsAtPoint: (CGPoint)point
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x]count])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(void)updateCharacterStatsForArmor:(RVArmor *)armor  withWeapons:(RVWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil)
    {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil)
    {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0)
    {
        self.character.health = self.character.health + healthEffect;
    }
    else
    {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
    
}


@end








