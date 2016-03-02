//
//  character.h
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


@protocol characterDelegate <NSObject>

-(void)characterDidtakeDamage:(CGFloat)dmg;
-(void)characterDidLevelUp:(CGFloat)lvl;
-(void)characterDidDie;

@end

@interface character : SKNode
{
    CGFloat health;
    int level;
    CGFloat scorePoint;
}


/** this character must die */
-(void)die;
/** this character must take damage */
-(void)takeDamage:(CGFloat)dmg;
/** this character must level up */
-(void)levelUp:(CGFloat)lvl;

-(void)setScorePoint:(CGFloat)Point;

@property(nonatomic,weak) id<characterDelegate> delegate;
/** get level this current character */
@property(nonatomic,assign,readonly) int level;
/** get health this current character */
@property(nonatomic,assign,readonly) CGFloat health;
/** get scorepoint this current character */
@property(nonatomic,assign,readonly) CGFloat scorePoint;

@end
