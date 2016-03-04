//
//  skButton.m
//  Trial
//
//  Created by Dealjava on 3/3/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "skButton.h"

@implementation skButton

-(instancetype)initWithImageNamed:(NSString *)name colorSelected:(UIColor*)color size:(CGSize)size{
    if (self==[super initWithColor:[SKColor clearColor] size:size]) {
        self.texture = [SKTexture textureWithImageNamed:name];
        self.colorBlendFactor = 0.5;
        _colorSelected = color;
        [self setIsBttnEnabled:YES];
        [self setIsBttnSelected:NO];
        [self setUserInteractionEnabled:YES];
        self.zPosition = kLayerUItop;
    }
    return self;
}

-(id)initWithTextureNormal:(SKTexture*)sktexture andTextureSelected:(SKTexture*)sktextureSel size:(CGSize)size{
    if (self==[super initWithColor:[SKColor clearColor] size:size]) {
        _normalTextur = sktexture;
        _selectedTexture = sktextureSel;
        _disabledTexture = sktexture;
        [self setIsBttnEnabled:YES];
        [self setIsBttnSelected:NO];
        [self setUserInteractionEnabled:YES];
        self.zPosition = kLayerUItop;
    }
    return self;
}


- (void)setTouchUpInsideTarget:(id)target action:(SEL)action {
    _targetTouchUpInside = target;
    _actionTouchUpInside = action;
}

- (void)setTouchDownTarget:(id)target action:(SEL)action {
    _targetTouchDown = target;
    _actionTouchDown = action;
}

- (void)setTouchUpTarget:(id)target action:(SEL)action {
    _targetTouchUp = target;
    _actionTouchUp = action;
}


#pragma mark - Setter overrides

- (void)setIsBttnEnabled:(BOOL)isBttnEnabled {
    _isBttnEnabled = isBttnEnabled;
    if ([self disabledTexture]) {
        if (!_isBttnEnabled) {
            [self setTexture:_disabledTexture];
        } else {
            [self setTexture:_normalTextur];
        }
    }else if ([self isBttnEnabled] && [self colorSelected]){
        if (_isBttnSelected) {
            self.color = self.colorSelected;
        }else{
            self.color = [SKColor clearColor];
        }
    }
}

- (void)setIsBttnSelected:(BOOL)isBttnSelected {
    _isBttnSelected = isBttnSelected;
    if ([self selectedTexture] && [self isBttnEnabled]) {
        if (_isBttnSelected) {
            [self setTexture:_selectedTexture];
        } else {
            [self setTexture:_normalTextur];
        }
    }else if ([self isBttnEnabled] && [self colorSelected]){
        if (_isBttnSelected) {
            self.color = self.colorSelected;
            self.xScale = 0.9;
            self.yScale = 0.9;
        }else{
            self.color = [SKColor clearColor];
            self.xScale = 1;
            self.yScale = 1;
        }
    }
}

#pragma mark Touch Handling

/**
 * This method only occurs, if the touch was inside this node. Furthermore if
 * the Button is enabled, the texture should change to "selectedTexture".
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self isBttnEnabled]) {
        objc_msgSend(_targetTouchDown, _actionTouchDown);
        [self setIsBttnSelected:YES];
    }
}

/**
 * If the Button is enabled: This method looks, where the touch was moved to.
 * If the touch moves outside of the button, the isSelected property is restored
 * to NO and the texture changes to "normalTexture".
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self isBttnEnabled]) {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInNode:self.parent];
        
        if (CGRectContainsPoint(self.frame, touchPoint)) {
            [self setIsBttnSelected:YES];
        } else {
            [self setIsBttnSelected:NO];
        }
    }
}

/**
 * If the Button is enabled AND the touch ended in the buttons frame, the
 * selector of the target is run.
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInNode:self.parent];
    
    if ([self isBttnEnabled] && CGRectContainsPoint(self.frame, touchPoint)) {
        objc_msgSend(_targetTouchUpInside, _actionTouchUpInside);
    }
    [self setIsBttnSelected:NO];
    objc_msgSend(_targetTouchUp, _actionTouchUp);
}

@end
