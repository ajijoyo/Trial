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
        
        playerTexture = [SKTexture textureWithImage:[UIImage imageNamed:@"Spaceship"]];
        CGSize sizeM = CGSizeMake(playerTexture.size.width * defaultScale, playerTexture.size.height * defaultScale);
        health = 100;
        playerSprite = [SKSpriteNode spriteNodeWithTexture:playerTexture size:sizeM];
        playerSprite.zPosition = kLayercharacters;
        self.physicsBody = [SKPhysicsBody bodyWithTexture:playerTexture size:sizeM];
        self.physicsBody.dynamic = NO;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.mass = 1.0;
        self.name = kphysicsBodyHero;

        _healthBar = [[TCProgressBarNode alloc]initWithSize:CGSizeMake(60, 10) backgroundColor:[SKColor groupTableViewBackgroundColor] fillColor:[SKColor greenColor] borderColor:[SKColor lightGrayColor] borderWidth:2 cornerRadius:4];
        _healthBar.zPosition = kLayertopMost;
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
    self.name = kphysicsBodyHero;
    _healthBar.position = CGPointMake(playerSprite.position.x, playerSprite.position.y - (playerSprite.size.height/2) - 8);

}

#pragma mark -  character delegate
-(void)characterDidDie{
    
}
-(void)characterDidLevelUp:(CGFloat)lvl{
    
}
-(void)characterDidtakeDamage:(CGFloat)dmg{
    
}

@end
