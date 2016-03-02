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
        SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:@"mushroom"]];
        self.color = [SKColor magentaColor];
        self.texture = texture;
        self.size = CGSizeMake(texture.size.width, texture.size.height);
        self.position = CGPointZero;
        self.zPosition = kLayercharacters;
        self.physicsBody = [SKPhysicsBody bodyWithTexture:texture size:self.size];
        self.physicsBody.affectedByGravity = NO;
        self.physicsBody.dynamic = YES;
        self.physicsBody.mass = 1;
        self.physicsBody.categoryBitMask = kBodyTypeBody;
        self.physicsBody.contactTestBitMask = kBodyTypeBody;
        self.name = kphysicsBodyEnemy;

    }
    return self;
}


-(void)die{
    [self removeFromParent];
}

@end
