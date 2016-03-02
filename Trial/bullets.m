//
//  bullets.m
//  Trial
//
//  Created by Dealjava on 3/2/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "bullets.h"

@implementation bullets

-(instancetype)initColor:(UIColor*)clr{
    if (self==[super init]) {
        
        bull = [SKShapeNode node];
        bull.path = CGPathCreateWithRoundedRect(CGRectMake(-5, -15, 10, 30), 5, 5, nil);
        bull.strokeColor = bull.fillColor = clr;
        [self addChild:bull];
        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 30)];
        self.physicsBody.dynamic = NO;
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.mass = 1.0;
        self.physicsBody.categoryBitMask = kBodyTypeBody;
        self.physicsBody.contactTestBitMask = kBodyTypeBody;
        self.name = kphysicsBodyBullets;
        
        SKAction *action = [SKAction moveByX:-5 y:500 duration:3];
        [self runAction:action completion:^{
            [self destroy];
        }];
        self.zPosition = kLayercharacters;

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
