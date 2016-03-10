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
    CGFloat damage;
    int level;
    CGFloat scorePoint;
    CGFloat experience;
    CGFloat maxExperience;
    
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
/** this character must get exp (CGFLOAT) */
-(void)GetExp:(CGFloat)expi;

/** this character must level up */
-(void)levelUp;

-(void)setScore:(CGFloat)Point;


/** get level this current character */
@property(nonatomic,assign,readonly) int level;
/** get health this current character */
@property(nonatomic,assign,readonly) CGFloat health;
/** get scorepoint this current character */
@property(nonatomic,assign,readonly) CGFloat scorePoint;
/** get experience when character is die */
@property(nonatomic,assign,readonly) CGFloat experience;
/** get max experience for bar exp */
@property(nonatomic,assign,readonly) CGFloat maxExperience;
/** get damage when character is HIT */
@property(nonatomic,assign,readonly) CGFloat damage;

@end
