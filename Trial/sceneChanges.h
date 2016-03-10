//
//  sceneChanges.h
//  Trial
//
//  Created by Dealjava on 3/10/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface sceneChanges : SKNode

+(void)finishwithPlayer:(SKNode*)player skscene:(SKScene*)scene onComplete:(void(^)())blocks;
+(void)finishwithPlayer:(SKNode*)player skscene:(SKScene*)scene;
@end
