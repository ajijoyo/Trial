//
//  playerShip.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "playerShip.h"

@implementation playerShip

-(instancetype)init{
    if (self==[super init]) {
        self.scale = 0.25;
        
        playerTexture = [SKTexture textureWithImage:[UIImage imageNamed:@"Spaceship"]];
        CGSize sizeM = CGSizeMake(playerTexture.size.width * self.scale, playerTexture.size.height * self.scale);
        health = 100;
        playerSprite = [SKSpriteNode spriteNodeWithTexture:playerTexture size:sizeM];
        playerSprite.zPosition = kLayerbackgrounds;
        self.physicsBody = [SKPhysicsBody bodyWithTexture:playerTexture size:sizeM];
        self.physicsBody.dynamic = NO;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.mass = 1.0;
        self.name = @"hero";

        _healthBar = [[TCProgressBarNode alloc]initWithSize:CGSizeMake(60, 10) backgroundColor:[SKColor groupTableViewBackgroundColor] fillColor:[SKColor greenColor] borderColor:[SKColor grayColor] borderWidth:2 cornerRadius:4];
        _healthBar.zPosition = kLayertopMost;
        _healthBar.position = CGPointMake(playerSprite.position.x, playerSprite.position.y - (playerSprite.size.height/2) - 8);
        
        [self addChild:_healthBar];
        [self addChild:playerSprite];
    }
    return self;
}



#pragma mark -  character delegate
-(void)characterDidDie{
    
}
-(void)characterDidLevelUp:(CGFloat)lvl{
    
}
-(void)characterDidtakeDamage:(CGFloat)dmg{
    
}

@end
