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
    
    player = [[playerShip alloc]init];
    player.position = CGPointMake(500, 160);
    player.scale = 0.25;
    player.healthBar.progress = 1;
    [player characterDidLevelUP:^(CGFloat lvl){
        NSLog(@"level up current damage %f",player.damage);
    }];
    
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(fire) userInfo:nil repeats:YES];
    [self addChild:player];
    
    myLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    myLabel.fontColor = [SKColor redColor];
    myLabel.text = [NSString stringWithFormat:@"Score %d",(int)player.scorePoint];
    myLabel.fontSize = 20;
    myLabel.position = CGPointMake(self.size.width - 16, self.size.height - 150);
    myLabel.zPosition = kLayertopMost;
    myLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    
    [self addChild:myLabel];
    
    [self generateEnemy];
    
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
    bullets *bullet = [[bullets alloc]initColor:[SKColor redColor] damage:player.damage];
    bullet.position = CGPointMake(player.position.x, player.position.y + (([player calculateAccumulatedFrame].size.height)/2) + 4);
    [self addChild:bullet];
}

-(void)generateEnemy{
    for (int i = 1; i<10; i++) {
        for (int j = 1; j< 3; j++) {
            mushroom *enm = [[mushroom alloc]init];
            enm.position = CGPointMake(100 * i, 450 + (j*80));
            [enm startAnim];
            [enm characterDidDie:^{
                [player setScore:100];
                myLabel.text = [NSString stringWithFormat:@"Score %d",(int)player.scorePoint];
                [player characterGetExp:enm.experience];
            }];
            [self addChild:enm];
        }
    }
}

#pragma mark - contactdelegate
-(void)didBeginContact:(SKPhysicsContact *)contact{

    if (contact.bodyA.categoryBitMask == kBodyTypeEnemy || contact.bodyB.categoryBitMask == kBodyTypeEnemy) {
        if ([contact.bodyA.node.name isEqualToString:kphysicsBodyEnemy]) {
            mushroom *ms = (mushroom*)contact.bodyA.node;
            bullets *bl = (bullets*)contact.bodyB.node;
            [ms takeDamage:bl.damage];
            [bl destroy];
            contact.bodyB.categoryBitMask = 0;
        }else if([contact.bodyB.node.name isEqualToString:kphysicsBodyEnemy]){
            mushroom *ms = (mushroom*)contact.bodyB.node;
            bullets *bl = (bullets*)contact.bodyA.node;
            [ms takeDamage:bl.damage];
            [bl destroy];
            contact.bodyA.categoryBitMask = 0;
            
        }
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
