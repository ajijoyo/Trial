//
//  sceneChanges.m
//  Trial
//
//  Created by Dealjava on 3/10/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "sceneChanges.h"

@implementation sceneChanges

+(void)finishwithPlayer:(SKNode*)player skscene:(SKScene*)scene onComplete:(void(^)())blocks{
    
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithWhite:0.5 alpha:0.3] size:CGSizeMake(kScreenWidth, kScreenHeight)];
    background.zPosition =kLayerUI;
    [scene addChild:background];
    SKAction *scale = [SKAction scaleTo:1.2 duration:1];
    SKAction *action = [SKAction moveToY:850 duration:3];
    SKAction *sequence = [SKAction sequence:@[scale,action]];
    [player runAction:sequence completion:^{
        if (blocks) {
            blocks();
        }
    }];
}
+(void)finishwithPlayer:(SKNode *)player skscene:(SKScene *)scene{
    [self finishwithPlayer:player skscene:scene onComplete:nil];
}
@end
