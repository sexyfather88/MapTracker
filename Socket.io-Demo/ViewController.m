//
//  ViewController.m
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/3.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import "ViewController.h"
#import "ClientLocation.h"
#import "AppSocket.h"

#define message @"訊息"

@interface ViewController ()
{
    NSMutableString * resultString;
    ClientLocation *userLocation;
    float zoom;
}
@end


@implementation ViewController


@synthesize mapManager;
@synthesize mapView;

- (void)viewDidLoad {
    NSLog(@"%@",message);
    
    zoom=15.0f;
    [super viewDidLoad];
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveMessage:) name:@"receiveSocketMessage" object:nil];

    [self setMapsInitial];
    
    
    userLocation=[[ClientLocation alloc]init];

}


-(void)setMapsInitial
{
    mapManager=[[GoogleMapsManager alloc]init];
    mapManager.delegate=self;
    
    mapView.settings.allowScrollGesturesDuringRotateOrZoom=YES;
    mapView.settings.myLocationButton = YES;
    mapView.delegate=self;
}


#pragma SocketIO Delegate
-(void)receiveMessage:(NSNotification*)notification
{
    NSDictionary *messageData=notification.object;

    NSArray *array=[messageData objectForKey:@"args"];
   
    NSLog(@"%@",[array objectAtIndex:0]);
  
    if ([[array objectAtIndex:0] isKindOfClass:[NSNull class]])
        return;

    
    if(![[array objectAtIndex:0]isEqualToString:@"SERVER"])
    {
        //[mapManager stopUpdatingLocation];
        
        NSDictionary *dic=[array objectAtIndex:1];
        
        ClientLocation *location=
        [[ClientLocation alloc]initWithLatitude:
        [[dic objectForKey:@"lat"]floatValue] andLongitude:[[dic objectForKey:@"lon"] floatValue]];
        
        [self updateOtherClientLocation:location];
    }
}

-(void)updateMaps
{
    
}





-(void)sendLocation:(CLLocation*)location
{
    NSDictionary *dataDic=@{@"lat":[NSNumber numberWithFloat: location.coordinate.latitude],@"lon":[NSNumber numberWithFloat:location.coordinate.longitude]};

    [[AppSocket getInstance]sendMessage:dataDic];
}

-(void)updateOtherClientLocation:(ClientLocation*)location
{
     GMSCameraUpdate *locationUpdate = [GMSCameraUpdate setCamera:[GMSCameraPosition cameraWithLatitude:location.latitude longitude:location.longitude zoom:zoom]];
    
    [mapView animateWithCameraUpdate:locationUpdate];
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    
    if(marker)
    {
        [mapView clear];
        //        marker.map = nil;
    }
    
    // Creates a marker in the center of the map.
    marker.position = CLLocationCoordinate2DMake(location.latitude,location.longitude);
    
    //    marker.icon = [UIImage imageNamed:@"bubble_right.png"];
    marker.title=@"driver";
    marker.userData=@"driver";
    marker.map = mapView;
    
    //    [mapView_ clear];
}
//
//- (void)locationManager:(CLLocationManager *)manager
//     didUpdateLocations:(NSArray *)locations {
//
//    mapView.myLocationEnabled = YES;
//
//    // If it's a relatively recent event, turn off updates to save power.
//    CLLocation* location = [locations lastObject];
//    NSDate* eventDate = location.timestamp;
//    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
//
//    
//    if (abs(howRecent) < 15.0) {
//        // Update your marker on your map using location.coordinate by using the GMSCameraUpdate object
//        
//        GMSCameraUpdate *locationUpdate = [GMSCameraUpdate setTarget:location.coordinate zoom:14];
//        [mapView animateWithCameraUpdate:locationUpdate];
//        
//        
//    }
//}
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    float lattitude=newLocation.coordinate.latitude;
    float longitude=newLocation.coordinate.longitude;

    
    NSLog(@"%f",lattitude);
    NSLog(@"%f",longitude);
    
    
    //[self showMaps:lattitude :longitude];
    
    mapView.myLocationEnabled = YES;

    
    GMSCameraUpdate *locationUpdate = [GMSCameraUpdate setTarget:newLocation.coordinate zoom:zoom];
    
    [mapView animateWithCameraUpdate:locationUpdate];

    
    [self sendLocation:newLocation];

}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@", error.description);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)position
{
    zoom=position.zoom;
    NSLog(@"mapView ended with panning/zooming in %s",__PRETTY_FUNCTION__);
}
//- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position
//{
//
//}
//- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture
//{
//
//}

@end
