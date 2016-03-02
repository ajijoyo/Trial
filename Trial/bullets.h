//
//  bullets.h
//  Trial
//
//  Created by Dealjava on 3/2/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface bullets : SKNode
{
    SKShapeNode *bull;
}
@property(nonatomic,assign,readonly)CGFloat damage;
-(instancetype)initColor:(UIColor*)clr damage:(CGFloat)dmg;
-(void)destroy;
@end
