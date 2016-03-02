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
-(instancetype)initColor:(UIColor*)clr;
-(void)destroy;
@end
