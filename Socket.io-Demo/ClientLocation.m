//
//  ClientLocation.m
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/9.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "ClientLocation.h"

@implementation ClientLocation

- (instancetype)init {
    return [self initWithLatitude:0 andLongitude:0];
}

- (instancetype)initWithLatitude:(float )latitude andLongitude:(float)longitude
{
    self = [super init];
    if (self) {
        self.latitude= latitude;
        self.longitude = longitude;
    }
    return self;
}

@end
