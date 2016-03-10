//
//  GameScene.h
//  Trial
//

//  Copyright (c) 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "playerShip.h"

@protocol gameSceneDelegate <NSObject>

-(void)gameSceneDidFinish;

@end

@interface GameScene : SKScene<SKPhysicsContactDelegate,SKSceneDelegate>
{
    playerShip *player;
    NSTimeInterval startTime;
    TCProgressBarNode *healtb;
    TCProgressBarNode *experienceBar;
    SKLabelNode *myLabel;
    SKLabelNode *levelLabel;
    NSMutableArray *arrayEnm;
}
@property(nonatomic,weak) id<gameSceneDelegate> sceneDelegate;
@end
