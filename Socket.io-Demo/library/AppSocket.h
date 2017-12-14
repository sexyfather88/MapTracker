//
//  AppConnect.h
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/9.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSocket : NSObject<SocketIODelegate>
{
    SocketIO *socketIO;
}

+ (AppSocket *)getInstance;
-(void)connectServer;
-(void)sendMessage:(id)object;

-(BOOL)isConnected;
@end
