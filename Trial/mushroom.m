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
        //set default mushroom
        health = 20;
        experience  = 10;
        
        //
        
        SKTexture *texture = [SKTexture textureWithImage:[UIImage imageNamed:@"mushroom"]];
        CGSize size = CGSizeMake(texture.size.width * 0.5, texture.size.height * 0.5);

        spriteMushroom = [SKSpriteNode spriteNodeWithTexture:texture size:size];
        spriteMushroom.color = [self randomColor];
        spriteMushroom.colorBlendFactor = 0.5f;

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

-(UIColor*)randomColor{
    NSArray *arrColor = @[[SKColor redColor],[SKColor yellowColor],[SKColor magentaColor],[SKColor redColor]
                          ,[SKColor greenColor],[SKColor grayColor],[SKColor purpleColor],[SKColor redColor]
                          ,[SKColor blueColor],[SKColor blackColor]];
    return arrColor[skRandom(arrColor.count)];
}

-(void)startAnim{
    float x = self.position.x;
    SKAction *a = [SKAction moveToX:x+skRand(0, 10) duration:0.5];
    SKAction *b = [SKAction moveToX:x-skRand(0, 10) duration:0.5];
    SKAction *sequence = [SKAction sequence:@[a,b]];
    [self runAction:[SKAction repeatActionForever:sequence]];
}

@end
