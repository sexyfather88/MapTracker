//
//  SlideInView.h
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideInView : UIView

@property (nonatomic, strong)  NSString *string;

@property (nonatomic, strong) IBOutlet UIView *dialogView;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) IBOutlet UILabel *subTitleLabel;



- (void)show;
-(void)showToWindow;

- (void)hide;
- (void)remove;


- (void)viewDidLoad;
@end
