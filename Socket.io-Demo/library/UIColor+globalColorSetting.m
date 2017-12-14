//
//  UIColor+globalColorSetting.m
//  FirebaseDemo
//
//  Created by lab702 on 2017/3/14.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "UIColor+globalColorSetting.h"


#define RGB(r, g, b)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]

#define RGB2(r, g, b, alpha)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@implementation UIColor (globalColorSetting)
+ (UIColor*)barTintColor
{
    NSArray *colorData=[NSArray new];
    
    colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"BarTintColor"];
    return [UIColor rgbColoWithRed:[colorData[0] floatValue] green:[colorData[1] floatValue] blue:[colorData[2] floatValue] alpha:[colorData[3] floatValue]];
}

+ (UIColor*)barSecondTintColor
{
    NSArray *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"ReturnButtonTintColor"];
    return [UIColor rgbColoWithRed:[colorData[0] floatValue] green:[colorData[1] floatValue] blue:[colorData[2] floatValue] alpha:[colorData[3] floatValue]];
}

+ (UIColor*)defaulfBarTintColor
{
    return [UIColor rgbColoWithRed:10.0f green:40.0f blue:75.0f];

}

+ (UIColor*)defaulfReturnButtonTintColor
{
    
    return [UIColor rgbColoWithRed:255.0f green:224.0f blue:3.0f];
}



+ (UIColor*)backgroundColor
{
    return [UIColor whiteColor];
    
    //return [UIColor colorWithRed:245.0f/255.0f green:245.0f/255.0f blue:245.0f/255.0f alpha:1.0f];
}

+ (UIColor*)rgbColoWithRed:(float)r green:(float)g blue:(float)b
{
    return RGB(r,g,b);
}

+ (UIColor*)rgbColoWithRed:(float)r green:(float)g blue:(float)b alpha:(float)alpha
{
    return RGB2(r, g, b,alpha);
}


+(NSString *)getHexStringFromColor
{
    return @"";
}


+ (UIColor*)receiveMessageBackgroundColor
{
    return [UIColor rgbColoWithRed:255.0f green:140.0f blue:159.0f];
}

+ (UIColor*)sendMessageBackgroundColor
{
    return [UIColor rgbColoWithRed:127.0f green:202.0f blue:217.0f];
}


- (void) openTurbo{
    
    NSLog(@"open Turbo!!!");
    
}

@end
