//
//  mushroom.m
//  Trial
//
//  Created by Dealjava on 3/2/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "mushroom.h"

@implementation mushroom


-(instancetype)init{
    if (self==[super init]) {
        health = 20;
        
        SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:@"mushroom"]];
        CGSize size = CGSizeMake(texture.size.width * 0.5, texture.size.height * 0.5);
        
        spriteMushroom = [SKSpriteNode spriteNodeWithTexture:texture size:size];
        self.position = CGPointZero;
        self.zPosition = kLayercharacters;
        
        self.physicsBody = [SKPhysicsBody bodyWithTexture:texture size:size];
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.dynamic = YES;
        self.physicsBody.mass = 1;
        self.physicsBody.categoryBitMask = kBodyTypeEnemy;
        self.physicsBody.contactTestBitMask = kBodyTypeBullets;
        self.name = kphysicsBodyEnemy;
        
        [self addChild:spriteMushroom];
    }
    return self;
}

-(void)startAnim{
    float x = self.position.x;
    SKAction *a = [SKAction moveToX:x+skRand(0, 10) duration:0.5];
    SKAction *b = [SKAction moveToX:x-skRand(0, 10) duration:0.5];
    SKAction *sequence = [SKAction sequence:@[a,b]];
    [self runAction:[SKAction repeatActionForever:sequence]];
}


#pragma mark -  character delegate
-(void)characterDidDie{
    [self removeFromParent];
}
-(void)characterDidLevelUp:(CGFloat)lvl{
    
}
-(void)characterDidtakeDamage:(CGFloat)dmg{
    NSLog(@"%f",dmg);
}

@end
