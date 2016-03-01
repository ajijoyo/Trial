//
//  ColorExtension.h
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor(ColorExtension)

/** Color with RGBA 255 max value */
+(UIColor*)colorFromR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A;

/** Color with RGB 255 max value */
+(UIColor*)colorFromR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B;

/** Color With hex #ffffff and alpha 0.9 */
+ (UIColor *)colorFromHexString:(NSString *)hexString andAlpha:(CGFloat)A;
/** Color With hex #ffffff  */
+ (UIColor *)colorFromHexString:(NSString *)hexString;
@end
