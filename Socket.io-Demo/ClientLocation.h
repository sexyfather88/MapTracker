//
//  ClientLocation.h
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/9.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClientLocation : NSObject


@property(assign, nonatomic) float latitude;
@property(assign, nonatomic) float longitude;



- (instancetype)initWithLatitude:(float )latitude andLongitude:(float)longitude;
@end
