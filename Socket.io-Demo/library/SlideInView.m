//
//  PopupView.m
//
//
//  Created by Wilson.Lin on 2017/3/19.
//  Copyright © 2017年 All rights reserved.
//

#import "SlideInView.h"
#import "AppDelegate.h"


@implementation SlideInView


-(void)showToWindow
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    if ( ! self.superview )
    {
        if (true)
        {
            [self.layer removeAllAnimations];
            
            UIWindow *currentWindow = [UIApplication sharedApplication].keyWindow;
            
            
            CGRect viewFrame =self.bounds;
            
            viewFrame.origin.y=64;
            viewFrame.size.width=[UIScreen mainScreen].bounds.size.width;
            viewFrame.size.height=0;
            
            self.frame = viewFrame;
            [currentWindow addSubview:self];

            
            [self viewDidLoad];
            
            viewFrame.size.height=44;
            
            self.subTitleLabel.text=self.string;
            self.subTitleLabel.alpha=0.0f;
            
            
            [UIView animateWithDuration:1.0f
                                  delay:0.0f
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^ {
                                 self.frame = viewFrame;
                                 self.subTitleLabel.alpha=1.0f;
                                 
                             }completion:^(BOOL finished) {
                                 
                                 
                             }];
            
        }
    }
    else
    {
        [self setNeedsLayout];
    }
}


- (void)show
{
    if(self)
    {
        
    }
    
    if ( ! self.superview )
    {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        [window makeKeyAndVisible];
        
        NSLog(@"%@",NSStringFromCGRect(self.dialogView.frame));
        
        UIViewController *root_view_controller =(UIViewController*)[[(AppDelegate*)[[UIApplication sharedApplication]delegate] window] rootViewController];
        
        
        while ( root_view_controller.presentedViewController )
        {
            root_view_controller = root_view_controller.presentedViewController;
            
        }
        NSLog(@"%@",NSStringFromCGRect(root_view_controller.view.frame));

        
        if ( root_view_controller )
        {
            [root_view_controller.view endEditing:YES];
            [self.layer removeAllAnimations];
            
            CGRect viewFrame =self.bounds;
            
            viewFrame.origin.y=0;
            viewFrame.size.width=root_view_controller.view.frame.size.width;
            viewFrame.size.height=0;
            
            self.frame = viewFrame;
            
            [root_view_controller.view addSubview:self];
            
            [self viewDidLoad];
            
            viewFrame.size.height=60;
            
            self.subTitleLabel.alpha=0.0f;
            
            [UIView animateWithDuration:1.0f
                                  delay:0.0f
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^ {
                                 self.frame = viewFrame;
                                 self.subTitleLabel.alpha=1.0f;
                                 
                             }completion:^(BOOL finished) {
                                 

                             }];
            

            

        }
    }
    else
    {
        [self setNeedsLayout];
    }
}

- (void)animate1
{
    [UIView animateWithDuration:0.16f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.dialogView.transform = CGAffineTransformMakeScale(1.03f, 1.03f);
                     }
                     completion:^(BOOL finished) {
                         [self animate2];
                     }];
}

- (void)animate2
{
    [UIView animateWithDuration:0.04f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.dialogView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)hide
{
    if ( self.superview )
    {
        [self.layer removeAllAnimations];
        
        
        CGRect dissapearFrame=self.frame;
        
        dissapearFrame.size.height=0;
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        
        [UIView animateWithDuration:1.0f
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^ {
                             self.frame = dissapearFrame;
                             
                             self.subTitleLabel.alpha=0.0f;
                         }completion:^(BOOL finished) {
                             
                             [self removeFromSuperview];
                             
                         }];
    }
    
}

- (void)remove
{
    [self removeFromSuperview];
}

- (void)viewDidLoad
{
    
}

@end
