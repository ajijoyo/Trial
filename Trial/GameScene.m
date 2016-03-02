//
//  GameScene.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright (c) 2016 oirignesia. All rights reserved.
//

#import "GameScene.h"
#import "mushroom.h"
#import "bullets.h"

#define kCyclesPerSecond 0.15f

@implementation GameScene



-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    self.backgroundColor = [SKColor whiteColor];
    self.physicsWorld.contactDelegate = self;
    
    mushroom *enm = [[mushroom alloc]init];
    enm.position = CGPointMake(150, 600);
    
    [self addChild:enm];
    
    player = [[playerShip alloc]init];
    player.position = CGPointMake(500, 500);
    player.healthBar.progress = 0.5;
    
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(fire) userInfo:nil repeats:YES];
    [self addChild:player];
    
    myLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    myLabel.fontColor = [SKColor redColor];
    myLabel.text = [NSString stringWithFormat:@"Score %d",(int)player.scorePoint];
    myLabel.fontSize = 20;
    myLabel.position = CGPointMake(self.size.width - 100, self.size.height - 150);
    myLabel.zPosition = kLayertopMost;
    
    [self addChild:myLabel];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKAction *move = [SKAction moveTo:location duration:0.5];
        [player runAction:move completion:^{
            
        }];
    }
}

-(void)fire{
    bullets *bullet = [[bullets alloc]initColor:[SKColor redColor]];
    bullet.position = CGPointMake(player.position.x, player.position.y + (([player calculateAccumulatedFrame].size.height)/2) + 4);
    [self addChild:bullet];
}

#pragma mark - contactdelegate
-(void)didBeginContact:(SKPhysicsContact *)contact{

    if ([contact.bodyA.node isKindOfClass:[mushroom class]]) {
        [((mushroom*)contact.bodyA.node) die];
        [((bullets*)contact.bodyB.node) destroy];
        [player setScorePoint:100];
        myLabel.text = [NSString stringWithFormat:@"Score %d",(int)player.scorePoint];
    }
    
}
-(void)didEndContact:(SKPhysicsContact *)contact{

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [super update:currentTime];
//    CGFloat secondsElapsed = currentTime - startTime;
//    CGFloat cycle = secondsElapsed * kCyclesPerSecond;
//    CGFloat progress = cycle - (NSInteger)cycle;
    
}

@end
