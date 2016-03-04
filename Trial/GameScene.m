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

#import "scenePause.h"
#import "skButton.h"

#define kCyclesPerSecond 0.15f

@implementation GameScene

-(void)bttnListener{
    if (self.paused) {
        self.paused = NO;
        for (SKNode *node in self.children) {
            if ([node isKindOfClass:[scenePause class]]) {
                [node removeFromParent];
                break;
            }
        }
    }else{
        self.paused = YES;
        scenePause *pause = [[scenePause alloc]init];
        pause.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:pause];
    }
}

-(void)didMoveToView:(SKView *)view {
    
    skButton *button = [[skButton alloc]initWithImageNamed:@"mushroom" colorSelected:[SKColor greenColor] size:CGSizeMake(50,50)];
    [button setTouchUpTarget:self action:@selector(bttnListener)];
    button.position = CGPointMake(self.size.width - 50, 150);
    [self addChild:button];
    
    self.backgroundColor = [SKColor whiteColor];
    self.physicsWorld.contactDelegate = self;
    
    player = [[playerShip alloc]init];
    player.position = CGPointMake(500, 160);
    player.scale = 0.25;
    player.healthBar.progress = 1;
    [player characterDidLevelUP:^(CGFloat lvl){
        levelLabel.text = [NSString  stringWithFormat:@"Level %d",(int)player.level];
    }];
    [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(fire) userInfo:nil repeats:YES];
    
    experienceBar = [[TCProgressBarNode alloc]initWithSize:CGSizeMake(self.view.bounds.size.width, 10) backgroundColor:[SKColor groupTableViewBackgroundColor] fillColor:[SKColor grayColor] borderColor:[SKColor lightGrayColor] borderWidth:2 cornerRadius:4];
    experienceBar.position = CGPointMake(self.size.width/2, 100);
    
    levelLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    levelLabel.fontColor = [SKColor redColor];
    levelLabel.text = [NSString stringWithFormat:@"Level %d",(int)player.level];
    levelLabel.fontSize = 20;
    levelLabel.position = CGPointMake(self.size.width/2 , 120);
    levelLabel.zPosition = kLayerUI;
    levelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    
    myLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    myLabel.fontColor = [SKColor redColor];
    myLabel.text = [NSString stringWithFormat:@"Score %d",(int)player.scorePoint];
    myLabel.fontSize = 20;
    myLabel.position = CGPointMake(self.size.width - 16, self.size.height - 150);
    myLabel.zPosition = kLayerUI;
    myLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeRight;
    
    [self addChild:levelLabel];
    [self addChild:player];
    [self addChild:experienceBar];
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
                [player GetExp:enm.experience];
                experienceBar.progress = (player.experience/player.maxExperience);
            }];
            [self addChild:enm];
        }
    }
}

#pragma mark - contactdelegate
-(void)didBeginContact:(SKPhysicsContact *)contact{

    if (contact.bodyA.categoryBitMask == kBodyTypeEnemy || contact.bodyB.categoryBitMask == kBodyTypeEnemy) {
        if (contact.bodyA.node.parent != nil && contact.bodyB.node.parent != nil) {
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
