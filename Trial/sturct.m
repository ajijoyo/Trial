//
//  sturct.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "sturct.h"

@implementation LAYER

#pragma mark - screen
CGFloat const kScreenWidth = 1024;

CGFloat const kScreenHeight = 768;

#pragma mark - layer
CGFloat const kLayerbackgrounds = 0;

CGFloat const kLayercharacters = 2;

CGFloat const kLayerbackgroundsTOP = 5;

CGFloat const kLayerUI = 9;

CGFloat const kLayerUItop = 10;

CGFloat const kLayertopMost = 15;

#pragma mark - physic body name
NSString *const kphysicsBodyHero = @"Hero";

NSString *const kphysicsBodyBullets = @"Bullets";

NSString *const kphysicsBodyEnemy = @"Enemy";


#pragma mark - body type for collision
UInt32 const kBodyTypeGround = 1;

UInt32 const kBodyTypeBody = 2;

UInt32 const kBodyTypeEnemy = 3;

UInt32 const kBodyTypeBullets = 4;

UInt32 const kBodyTypeCharacter = 5;




@end


