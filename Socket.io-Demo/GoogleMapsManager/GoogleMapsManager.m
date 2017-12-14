//
//  GoogleMapsManager.m
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/8.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "GoogleMapsManager.h"

@implementation GoogleMapsManager

- (instancetype)init {
    self = [super init];
    if (self) {
        self.desiredAccuracy = kCLLocationAccuracyBestForNavigation ;
        //    [locationManager requestAlwaysAuthorization];
        [self requestWhenInUseAuthorization];
        self.allowsBackgroundLocationUpdates = true;
//        [self startUpdatingHeading];

        [self startUpdatingLocation];
    }
    return self;

}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@", error.description);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
}
@end
