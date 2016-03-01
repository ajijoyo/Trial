//
//  ColorExtension.m
//  Trial
//
//  Created by Dealjava on 3/1/16.
//  Copyright © 2016 oirignesia. All rights reserved.
//

#import "ColorExtension.h"

@implementation UIColor(ColorExtension)

+(UIColor*)colorFromR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A{
    return [UIColor colorWithRed:R/255 green:G/255  blue:B/255  alpha:A];
}
+(UIColor*)colorFromR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B{
    return [UIColor colorFromR:R G:G B:B A:1];
}

+(UIColor*)colorFromHexString:(NSString*)hexString{
    return [UIColor colorFromHexString:hexString andAlpha:1];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString andAlpha:(CGFloat)A {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:A];
}

@end
