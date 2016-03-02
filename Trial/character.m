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

    }
    return self;
}

-(void)levelUp:(CGFloat)lvl{
    level = lvl;

    if (_delegate) {
        [_delegate characterDidLevelUp:level];
    }
}

-(void)setScorePoint:(CGFloat)Point{
    scorePoint += Point;
}

-(void)takeDamage:(CGFloat)dmg{
    CGFloat currHealth = health - dmg;
    if (currHealth >= 0) {
        health = currHealth;
        if (_delegate) {
            [_delegate characterDidtakeDamage:dmg];
        }
    }else{
        [self die];
    }
}

-(void)die{
    NSLog(@"Player must die");
    
    if (self.delegate) {
        [self.delegate characterDidDie];
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
@end
