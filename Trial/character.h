//
//  character.h
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


typedef void (^characterHandler)();
typedef void (^characterHandlerParams)(CGFloat count);

@interface character : SKNode
{
    CGFloat health;
    int level;
    CGFloat scorePoint;
    
    characterHandler action;
    characterHandlerParams actiondamage;
    characterHandlerParams actionlvl;
}
/** called when character is destory */
-(void)characterDidDie:(characterHandler)handler;
/** called when character is taken damage */
-(void)characterTakeDamage:(characterHandlerParams)handler;
/** called when character is levelup */
-(void)characterDidLevelUP:(characterHandlerParams)handler;

/** this character must die */
-(void)destroy;
/** this character must take damage */
-(void)takeDamage:(CGFloat)dmg;
/** this character must level up */
-(void)levelUp:(CGFloat)lvl;

-(void)setScore:(CGFloat)Point;

/** get level this current character */
@property(nonatomic,assign,readonly) int level;
/** get health this current character */
@property(nonatomic,assign,readonly) CGFloat health;
/** get scorepoint this current character */
@property(nonatomic,assign,readonly) CGFloat scorePoint;

@end
