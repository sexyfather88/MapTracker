//
//  UIColor+globalColorSetting.h
//  FirebaseDemo
//
//  Created by lab702 on 2017/3/14.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (globalColorSetting)

+ (UIColor*)barTintColor;
+ (UIColor*)barSecondTintColor;

+ (UIColor*)defaulfBarTintColor;
+ (UIColor*)defaulfReturnButtonTintColor;


+ (UIColor*)backgroundColor;

+ (UIColor*)receiveMessageBackgroundColor;
+ (UIColor*)sendMessageBackgroundColor;

+ (UIColor*)rgbColoWithRed:(float)r green:(float)g blue:(float)b;
+ (UIColor*)rgbColoWithRed:(float)r green:(float)g blue:(float)b alpha:(float)alpha;
- (void) openTurbo;
@end
