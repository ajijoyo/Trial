//
//  skButton.h
//  Trial
//
//  Created by Dealjava on 3/3/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface skButton : SKSpriteNode

@property (nonatomic, readonly) SEL actionTouchUpInside;
@property (nonatomic, readonly) SEL actionTouchDown;
@property (nonatomic, readonly) SEL actionTouchUp;
@property (nonatomic, readonly, weak) id targetTouchUpInside;
@property (nonatomic, readonly, weak) id targetTouchDown;
@property (nonatomic, readonly, weak) id targetTouchUp;
@property(nonatomic,readonly,strong) UIColor *colorSelected;

@property (nonatomic) BOOL isBttnEnabled;
@property (nonatomic) BOOL isBttnSelected;
@property (nonatomic, readonly, strong) SKLabelNode *title;
@property (nonatomic, readwrite, strong) SKTexture *normalTextur;
@property (nonatomic, readwrite, strong) SKTexture *selectedTexture;
@property (nonatomic, readwrite, strong) SKTexture *disabledTexture;

-(instancetype)initWithImageNamed:(NSString *)name colorSelected:(UIColor*)color size:(CGSize)size;
-(id)initWithTextureNormal:(SKTexture*)sktexture andTextureSelected:(SKTexture*)sktextureSel size:(CGSize)size;

- (void)setTouchUpInsideTarget:(id)target action:(SEL)action;
- (void)setTouchDownTarget:(id)target action:(SEL)action;
- (void)setTouchUpTarget:(id)target action:(SEL)action;

@end
