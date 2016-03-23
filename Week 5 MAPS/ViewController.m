//
//  ViewController.m
//  Week 5 MAPS
//
//  Created by Bryan Fein on 8/10/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize locationManager, mapView;



- (void)viewDidLoad {
    [super viewDidLoad];

    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    mapView.showsUserLocation =YES;
    
    [self.logo setImage:[UIImage imageNamed:@"logo.png"]];
    
    self.mapView.delegate = self;
    
    //make space before you set delegat
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.delegate = self;
    
//    //searchBar
    self.navigationItem.titleView = self.searchBar;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex)
    {
        case 0:
            mapView.mapType =MKMapTypeStandard;
            break;
            
        case 1:
            mapView.mapType = MKMapTypeHybrid;
            break;
            
        case 2:
            mapView.mapType = MKMapTypeSatellite;
            break;
            
        default:
            break;
    }
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"Location: %f, %f",
          userLocation.location.coordinate.latitude,
          userLocation.location.coordinate.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate, 1000, 1000);
    [self.mapView setRegion:region animated:YES];

    //custom locations
    
    MapPin *location = [[MapPin alloc]initWithTitle:@"My Location" subtitle:@"New York" location:userLocation.coordinate url:nil];
    [self.mapView addAnnotation:location];
    
    MapPin *turnToTech = [[MapPin alloc]initWithTitle:@"Turn To Tech" subtitle:@"New York" location:(CLLocationCoordinate2DMake(40.741448, -73.989969)) url:@"http://turntotech.io/"];
    
    [self.mapView addAnnotation:turnToTech];
    
    MapPin *flatIronBuilding = [[MapPin alloc] initWithTitle:@"FlatIron Building" subtitle:@"Some cool ass building" location:(CLLocationCoordinate2DMake(40.74106, -73.989699)) url:@"https://en.wikipedia.org/wiki/Flatiron_Building"];
    
    [self.mapView addAnnotation:flatIronBuilding];
    
    MapPin *shakeShack = [[MapPin alloc] initWithTitle:@"Shake Shack" subtitle:@"Where the line is way too long" location:(CLLocationCoordinate2DMake(40.741449, -73.988205)) url:@"https://www.shakeshack.com/"];

    [self.mapView addAnnotation:shakeShack];
    
//    self.annotations = [[NSMutableArray alloc]initWithObjects:location,turnToTech,flatIronBuilding,shakeShack, nil];
    
//    [self.mapView addAnnotation:self.annotations];
    
    
    
    //call count
    callCount++;
    
    if (!(callCount%10 == 0)) {
        return;
    }
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    static NSString *identifier = @"Location";
    if([annotation isKindOfClass:[MapPin class]]){
        MKAnnotationView *view =
        [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (view == nil) {
            view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
            view.enabled = YES;
            view.canShowCallout = YES;
            view.image = [UIImage imageNamed:@"map.png"];
            view.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"building.png"]];
            view.rightCalloutAccessoryView = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
            
        } else {
            view.annotation = annotation;
        }
        return view;
    }
    return nil;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    self.webView = [WebViewViewController new];
    MapPin *mapPin = view.annotation;
    
    self.webView.webUrl = mapPin.url;
    
    [self.navigationController pushViewController: self.webView animated:YES];
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    [searchBar resignFirstResponder];
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = searchBar.text;
    request.region = self.mapView.region;
    
    MKLocalSearch *search = [[MKLocalSearch alloc] initWithRequest:request];
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (MKMapItem *item in response.mapItems) {
            [array addObject:item.placemark];
        }
        [self.mapView removeAnnotations: self.mapView.annotations];
        [self.mapView showAnnotations: array animated:YES];
        
        NSLog(@"Map Items: %@", response.mapItems);
    }];
    
}

@end
