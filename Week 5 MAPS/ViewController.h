//
//  ViewController.h
//  Week 5 MAPS
//
//  Created by Bryan Fein on 8/10/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPin.h"
#import "WebViewViewController.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate,UISearchBarDelegate, UISearchControllerDelegate>

{
    int callCount;

}

@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *annotations; 
@property (strong, nonatomic) WebViewViewController *webView;
@property (strong, nonatomic) NSString *URL;

@property (strong, nonatomic) UISearchBar * searchBar;



//@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;


- (IBAction)setMap:(id)sender;

@end

