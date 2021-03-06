//
//  character.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "character.h"

@implementation character



-(instancetype)init{
    if (self==[super init]) {
        level = 1;
        scorePoint = 0;

    }
    return self;
}


-(void)characterDidDie:(characterHandler)handler{
    action = handler;
}
-(void)characterDidLevelUP:(characterHandlerParams)handler{
    actionlvl = handler;
}
-(void)characterTakeDamage:(characterHandlerParams)handler{
    actiondamage = handler;
}

-(void)levelUp{
    level ++;
    if (actionlvl) {
        actionlvl(level);
    }
}

-(void)setScore:(CGFloat)Point{
    scorePoint += Point;
}

-(void)GetExp:(CGFloat)expi{
    experience += expi;
}

-(void)takeDamage:(CGFloat)dmg{
    CGFloat currHealth = health - dmg;
    if (currHealth > 0) {
        health = currHealth;
        if (actiondamage) {
            actiondamage(dmg);
        }
    }else{
        [self destroy];
    }
}

-(void)destroy{
    [self removeFromParent];
    if (action) {
        action();
    }
}

#pragma mark - getter
-(int)level{
    return level;
}
-(CGFloat)health{
    return health;
}
-(CGFloat)scorePoint{
    return scorePoint;
}
-(CGFloat)experience{
    return experience;
}
-(CGFloat)damage{
    return damage;
}
-(CGFloat)maxExperience{
    return maxExperience;
}
@end
