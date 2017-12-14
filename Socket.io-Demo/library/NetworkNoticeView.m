//
//  NetworkNoticeView.m
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "NetworkNoticeView.h"

__strong static NetworkNoticeView *_instance = nil;


@implementation NetworkNoticeView

+ (void)showNetworkLoading{
    
    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance remove];
            
            _instance = nil;
        }
        
         _instance= [[NSBundle mainBundle] loadNibNamed:@"NetworkNoticeView" owner:nil options:nil].lastObject;
        _instance.activityIndicatorView.hidden=NO;
        
        _instance.activityIndicatorView.frame=CGRectMake(_instance.subTitleLabel.frame.origin.x+_instance.subTitleLabel.frame.size.width, _instance.activityIndicatorView.frame.origin.y, _instance.activityIndicatorView.frame.size.width, _instance.activityIndicatorView.frame.size.height);
        
        [_instance show];
    };
    
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
}


+ (void)showNetworkConnectSuccess{
    
    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance remove];
            
            _instance = nil;
        }
        
        _instance= [[NSBundle mainBundle] loadNibNamed:@"NetworkNoticeView" owner:nil options:nil].lastObject;
        _instance.subTitleLabel.text=@"已連線成功";
        _instance.backgroundColor=[UIColor rgbColoWithRed:44.0f green:192.0f blue:113.0f];
        _instance.activityIndicatorView.hidden=YES;
        [_instance show];
    };
    
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
    
    [self performSelector:@selector(hide) withObject:nil afterDelay:2];

}

+ (void)showNetworkConnectFail
{
    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance remove];
            
            _instance = nil;
        }
        
        _instance= [[NSBundle mainBundle] loadNibNamed:@"NetworkNoticeView" owner:nil options:nil].lastObject;
        _instance.subTitleLabel.text=@"已斷開連線";
        _instance.activityIndicatorView.hidden=YES;
        _instance.backgroundColor=[UIColor rgbColoWithRed:240.0f green:65.0f blue:52.0f];
        
        [_instance show];
    };
    
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
    
    [self performSelector:@selector(hide) withObject:nil afterDelay:2];

}

+ (void)showPromptView:(NSString*)string {
    
    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance remove];
            
            _instance = nil;
        }
        
        _instance= [[NSBundle mainBundle] loadNibNamed:@"PromptView" owner:nil options:nil].lastObject;
        
        _instance.string=string;
        [_instance showToWindow];
    };
    
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
    
    
    [self performSelector:@selector(hide) withObject:nil afterDelay:2];
}

+ (void)hide{

    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance hide];
            _instance = nil;
        }
    };
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
}

- (IBAction)onCancelClicked:(id)sender
{
    [self hide];
}

@end
