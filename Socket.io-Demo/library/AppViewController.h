//
//  AppViewController.h
//  FirebaseDemo
//
//  Created by user on 2017/10/31.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppViewController : NSObject

+(UINavigationController*)nowNavigationController;

+ (UIAlertController*)customAlertControllerWithTitle:(NSString *)title titleColor:(UIColor*)titleColor subTitle:(NSString *)subTitle subTitleColor:(UIColor*)subTitleColor BackgroundColor:(UIColor*)BackgroundColor textTintColor:(UIColor*)textTintColor;

+ (UIAlertController*)customListAlertControllerWithTitle:(NSString *)title titleColor:(UIColor*)titleColor subTitle:(NSString *)subTitle subTitleColor:(UIColor*)subTitleColor BackgroundColor:(UIColor*)BackgroundColor textTintColor:(UIColor*)textTintColor;


+ (UIAlertController*)weTalkAlertControllerWithTitle:(NSString *)title ;

+(void)showWeTalkNoticeAlert:(NSString *)title;

-(void)setTitle;

@end
