//
//  sturct.h
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LAYER : NSObject

/** layer for background 0 */
extern CGFloat const kLayerbackgrounds;
/** layer for character 2 */
extern CGFloat const kLayercharacters;
/** layer for most TOP 10 */
extern CGFloat const kLayertopMost;

/** physicsBody name for hero */
extern NSString *const kphysicsBodyHero;
/** physicsBody name for bullets */
extern NSString *const kphysicsBodyBullets;
/** physicsBody name for enemy */
extern NSString *const kphysicsBodyEnemy;

/** categoryBitMask int for ground */
extern UInt32 const kBodyTypeGround;
/** categoryBitMask int for body */
extern UInt32 const kBodyTypeBody;

extern UInt32 const kBodyTypeEnemy;

extern UInt32 const kBodyTypeBullets;

extern UInt32 const kBodyTypeCharacter;



@end
