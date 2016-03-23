//
//  MapPin.h
//  Week 5 MAPS
//
//  Created by Bryan Fein on 8/10/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>



@interface MapPin : NSObject <MKAnnotation>


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *url;


-(id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle location:(CLLocationCoordinate2D)location url:(NSString *)url;



@end
