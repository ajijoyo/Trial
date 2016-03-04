//
//  sturct.h
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LAYER : NSObject
/** screen Width  */
extern CGFloat const kScreenWidth;
/** screen height */
extern CGFloat const kScreenHeight;

/** layer for background 0 */
extern CGFloat const kLayerbackgrounds;
/** layer for character 2 */
extern CGFloat const kLayercharacters;
/** layer for most TOP 10 */
extern CGFloat const kLayertopMost;
/** layer for background on top */
extern CGFloat const kLayerbackgroundsTOP;
/** layer for UI etc */
extern CGFloat const kLayerUI;
/** layer for top UI etc */
extern CGFloat const kLayerUItop;

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
/** categoryBitMask int for enemy */
extern UInt32 const kBodyTypeEnemy;
/** categoryBitMask int for bullets */
extern UInt32 const kBodyTypeBullets;
/** categoryBitMask int for character */
extern UInt32 const kBodyTypeCharacter;



@end
