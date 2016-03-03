//
//  GameScene.h
//  Trial
//

//  Copyright (c) 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "playerShip.h"

@interface GameScene : SKScene<SKPhysicsContactDelegate>
{
    playerShip *player;
    NSTimeInterval startTime;
    
    TCProgressBarNode *healtb;
    TCProgressBarNode *experienceBar;
    SKLabelNode *myLabel;
    SKLabelNode *levelLabel;
}
@end
