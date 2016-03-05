//
//  bullets.m
//  Trial
//
//  Created by Dealjava on 3/2/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "bullets.h"

@implementation bullets

-(instancetype)initColor:(UIColor*)clr damage:(CGFloat)dmg{
    if (self==[super init]) {
        _damage = dmg;
        
        bull = [SKShapeNode node];
        bull.path = CGPathCreateWithRoundedRect(CGRectMake(-_damage /2, -15, _damage, 30), _damage/2, 5, nil);
        bull.strokeColor = bull.fillColor = clr;
        [self addChild:bull];
        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(_damage, 30)];
        self.physicsBody.dynamic = NO;
        self.physicsBody.allowsRotation = NO;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.mass = 1.0;
        self.physicsBody.categoryBitMask = kBodyTypeBullets;
        self.physicsBody.contactTestBitMask = kBodyTypeEnemy | kBodyTypeGround;
        self.name = kphysicsBodyBullets;
        
        self.zPosition = kLayercharacters;
        
        SKAction *action = [SKAction moveByX:-_damage /2 y:500 duration:3];
        [self runAction:action completion:^{
            [self destroy];
        }];

    }
    return self;
}

-(void)startAnim{
    
}

-(void)destroy{

    [self removeFromParent];
}

-(void)dealloc{

}


@end
