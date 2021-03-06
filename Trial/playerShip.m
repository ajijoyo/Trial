//
//  playerShip.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "playerShip.h"
#import "bullets.h"

CGFloat const defaultScale = 0.25;


@implementation playerShip

-(instancetype)init{
    if (self==[super init]) {
        //set base player
        health = 100;
        damage = 10;
        maxExperience = 50;
        //

        playerTexture = [SKTexture textureWithImage:[UIImage imageNamed:@"Spaceship"]];
        CGSize sizeM = CGSizeMake(playerTexture.size.width * defaultScale, playerTexture.size.height * defaultScale);
        
        playerSprite = [SKSpriteNode spriteNodeWithTexture:playerTexture size:sizeM];
        
        self.zPosition = kLayercharacters;
        self.physicsBody = [SKPhysicsBody bodyWithTexture:playerTexture size:sizeM];
        self.physicsBody.dynamic = NO;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.mass = 1.0;
        self.physicsBody.categoryBitMask = kBodyTypeCharacter;
        self.physicsBody.contactTestBitMask = kBodyTypeEnemy;
        self.name = kphysicsBodyHero;

        _healthBar = [[TCProgressBarNode alloc]initWithSize:CGSizeMake(60, 10) backgroundColor:[SKColor groupTableViewBackgroundColor] fillColor:[SKColor greenColor] borderColor:[SKColor lightGrayColor] borderWidth:2 cornerRadius:4];
        _healthBar.zPosition = kLayercharacters;
        _healthBar.position = CGPointMake(playerSprite.position.x, playerSprite.position.y - (playerSprite.size.height/2) - 8);
        _healthBar.progress = 1;
        [self addChild:_healthBar];
        [self addChild:playerSprite];
        
    }
    return self;
}
-(void)setScale:(CGFloat)scale{
    
    playerSprite.size =  CGSizeMake(playerTexture.size.width * scale, playerTexture.size.height * scale);
    self.physicsBody = [SKPhysicsBody bodyWithTexture:playerTexture size:playerSprite.size];
    self.physicsBody.dynamic = NO;
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.mass = 1.0;
    self.physicsBody.categoryBitMask = kBodyTypeCharacter;
    self.physicsBody.contactTestBitMask = kBodyTypeEnemy;
    self.name = kphysicsBodyHero;
    _healthBar.position = CGPointMake(playerSprite.position.x, playerSprite.position.y - (playerSprite.size.height/2) - 8);

}

-(void)GetExp:(CGFloat)expi{
    [super GetExp:expi];
    if (experience >=  maxExperience) {
        experience = 0;//reset exp
        maxExperience += maxExperience * 1.2;//add max eperience
        damage += 10;
        [self levelUp];
    }
}

@end
