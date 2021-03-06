//
//  AppDelegate.m
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/3.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AppSocket.h"
#import "test.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [GMSServices provideAPIKey:@"AIzaSyAlmWvzf1taS1II8fVZz6Yn6ySRPAnuWo8"];

    
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *page=[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];

    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:page];
    nav.navigationBar.barTintColor=[UIColor defaulfBarTintColor];
    
//    test *page2=[[test alloc]initWithRootViewController:page];
//    
//    [page2 setProgrammPublicName:@"ABC"];
//    
//    NSLog(@"%@",page2.programmPublicName);

    self.window.rootViewController=nav;
    [self.window makeKeyWindow];
    
    [[AppSocket getInstance]connectServer];
    

    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
//    UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
//    id topViewController = navigationController.topViewController;
//    if ([topViewController isKindOfClass:[ViewController class]]) {
//        [(ViewController*)topViewController insertNewObjectForFetchWithCompletionHandler:completionHandler];
//    } else {
//        NSLog(@"Not the right class %@.", [topViewController class]);
//        completionHandler(UIBackgroundFetchResultFailed);
//    }
//    NSLog(@"performFetchWithCompletionHandler");
}

@end
