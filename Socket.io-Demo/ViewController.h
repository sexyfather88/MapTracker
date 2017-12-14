//
//  ViewController.h
//  Socket.io-Demo
//
//  Created by Wilson on 2017/12/3.
//  Copyright © 2017年 Wilson. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "GoogleMapsManager.h"

@interface ViewController : UIViewController<GMSMapViewDelegate,CLLocationManagerDelegate>


@property (nonatomic, strong) CLLocationManager  *locationManager;

@property (nonatomic, strong)IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) GoogleMapsManager *mapManager;
@property (nonatomic, assign) CLLocationCoordinate2D currentLocationCoordinate;



@end
