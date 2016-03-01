//
//  GameScene.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright (c) 2016 oirignesia. All rights reserved.
//

#import "GameScene.h"

#define kCyclesPerSecond 0.15f

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor whiteColor];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        player = [[playerShip alloc]init];
        player.position = location;
        player.healthBar.progress = 0.5;
        [self addChild:player];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
    
}

@end
