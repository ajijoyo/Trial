//
//  GameScene.h
//  Trial
//

//  Copyright (c) 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "playerShip.h"

@interface GameScene : SKScene
{
    playerShip *player;
    NSTimeInterval startTime;
}
@end
