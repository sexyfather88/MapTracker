//
//  AppViewController.m
//  FirebaseDemo
//
//  Created by user on 2017/10/31.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "AppViewController.h"
#import "AppDelegate.h"


@implementation AppViewController


+(UINavigationController*)nowNavigationController
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [window makeKeyAndVisible];
    
    UINavigationController *root_view_controller =(UINavigationController*)[[(AppDelegate*)[[UIApplication sharedApplication]delegate] window] rootViewController];
    
    while ( root_view_controller.presentedViewController )
    {
        root_view_controller = (UINavigationController*)root_view_controller.presentedViewController;
    }
    
    
    return root_view_controller;
}

+ (UIAlertController*)customAlertControllerWithTitle:(NSString *)title titleColor:(UIColor*)titleColor subTitle:(NSString *)subTitle subTitleColor:(UIColor*)subTitleColor BackgroundColor:(UIColor*)BackgroundColor textTintColor:(UIColor*)textTintColor
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
        message:subTitle
        preferredStyle:UIAlertControllerStyleAlert];
    
    alert.view.tintColor=textTintColor;
    
    NSMutableAttributedString *_AttributedString = [[NSMutableAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName:titleColor}];
    
    [alert setValue:_AttributedString forKey:@"attributedTitle"];
    
    UIView *firstSubview = alert.view.subviews.firstObject;
    UIView *alertContentView = firstSubview.subviews.firstObject;
    for (UIView *subSubView in alertContentView.subviews) { //This is main catch
        subSubView.backgroundColor = BackgroundColor; //Here you change background
    }
    return alert;
}

+ (UIAlertController*)customListAlertControllerWithTitle:(NSString *)title titleColor:(UIColor*)titleColor subTitle:(NSString *)subTitle subTitleColor:(UIColor*)subTitleColor BackgroundColor:(UIColor*)BackgroundColor textTintColor:(UIColor*)textTintColor
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:subTitle
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    alert.view.tintColor=textTintColor;
    
    NSMutableAttributedString *_AttributedString = [[NSMutableAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName:titleColor}];
    
    [alert setValue:_AttributedString forKey:@"attributedTitle"];
    
    UIView *firstSubview = alert.view.subviews.firstObject;
    UIView *alertContentView = firstSubview.subviews.firstObject;
    for (UIView *subSubView in alertContentView.subviews) { //This is main catch
        subSubView.backgroundColor = BackgroundColor; //Here you change background
    }
    return alert;
}

+ (UIAlertController*)weTalkAlertControllerWithTitle:(NSString *)title
{
    return [self customAlertControllerWithTitle:title titleColor:[UIColor barTintColor] subTitle:nil subTitleColor:nil BackgroundColor:[UIColor barSecondTintColor] textTintColor:[UIColor barTintColor]];
}

+(void)showWeTalkNoticeAlert:(NSString *)title;
{
    UIAlertController *alert=[AppViewController weTalkAlertControllerWithTitle:title];
    
    UIAlertAction *okAction =
    [UIAlertAction actionWithTitle:@"確認"style:UIAlertActionStyleDefault
                           handler:nil];
    [alert addAction:okAction];
    [[AppViewController nowNavigationController] presentViewController:alert animated:YES completion:nil];
}



@end
