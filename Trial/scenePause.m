//
//  scenePause.m
//  Trial
//
//  Created by Dealjava on 3/3/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "scenePause.h"

@implementation scenePause

-(id)init{
    if (self==[super init]) {

        backgroundSprite = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithWhite:0.5 alpha:0.3] size:CGSizeMake(kScreenWidth, kScreenHeight)];
        self.zPosition = kLayerUI;
        [self addChild:backgroundSprite];
        
    }
    return self;
}

@end
