//
//  AppConnect.m
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/9.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "AppSocket.h"

@implementation AppSocket

+ (AppSocket *)getInstance
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    //static id sharedObject = nil;  //if you're not using ARC
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
        
    });
    return sharedObject;
}

-(void)connectServer
{
    socketIO = [[SocketIO alloc] initWithDelegate:self];

    [socketIO connectToHost:@"192.168.31.171" onPort:8124];
    
    NSUUID *identifierForVendor = [[UIDevice currentDevice] identifierForVendor];
    NSString *deviceId = [identifierForVendor UUIDString];
    

    //NSString *uuid = [[NSUUID UUID] UUIDString];

    [socketIO sendEvent:@"addme" withData:deviceId];
    
    if(!socketIO.isConnected)
    {

//        [AppViewController nowNavigationController].title=@"NO";
//        [[AppViewController nowNavigationController].navigationBar.topItem setTitle:@"Title"];
//        [[AppViewController nowNavigationController].navigationBar setTitleTextAttributes:
//         @{NSForegroundColorAttributeName:[UIColor yellowColor]}];
//        
        [NetworkNoticeView showNetworkLoading];
        
        [self performSelector:@selector(reConnectServer) withObject:nil afterDelay:4.0f];
    }
    
}

-(void)sendMessage:(NSDictionary*)data
{
    [socketIO sendEvent:@"sendchat" withData:data];
}

- (void) socketIO:(SocketIO *)socket didReceiveEvent:(SocketIOPacket *)packet{
    
    //packet.name
    if ([packet.name isEqualToString:@"chat"]) {
        NSDictionary * stringData = (NSDictionary *)
        [NSJSONSerialization JSONObjectWithData:
        [packet.data dataUsingEncoding:NSUTF8StringEncoding]
        options:NSJSONReadingMutableContainers error:NULL];
        
    
        [[NSNotificationCenter defaultCenter] postNotificationName:@"receiveSocketMessage" object:stringData];
        
//        NSLog(@"*********************************\n%@\n*****************************",stringData);
        
    }
}

- (void) socketIODidConnect:(SocketIO *)socket
{
    [NetworkNoticeView showNetworkConnectSuccess];
    
    
    NSLog(@"\n****************************\n已連線\n****************************");
}
- (void) socketIODidDisconnect:(SocketIO *)socket disconnectedWithError:(NSError *)error
{
    [NetworkNoticeView showNetworkConnectFail];
    


}

-(void)reConnectServer
{
    if(!socketIO.isConnected)
    
    {
        socketIO = [[SocketIO alloc] initWithDelegate:self];
        
        [socketIO connectToHost:@"192.168.0.107" onPort:8124];
        
        [socketIO sendEvent:@"addme" withData:@"client"];
        
        if(!socketIO.isConnected)
            [NetworkNoticeView showNetworkConnectFail];
    }
}

-(BOOL)isConnected;
{
    return self.isConnected;
}



@end
