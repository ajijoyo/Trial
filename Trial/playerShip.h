//
//  playerShip.h
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "character.h"
#import "TCProgressBarNode.h"

@interface playerShip : character<characterDelegate>
{
    SKTexture *playerTexture;
    SKSpriteNode *playerSprite;
}

-(void)fire;

@property(nonatomic,strong,readonly) TCProgressBarNode *healthBar;
@property(nonatomic,assign)CGFloat scale;
@end
