//
//  MapPin.m
//  Week 5 MAPS
//
//  Created by Bryan Fein on 8/10/15.
//  Copyright (c) 2015 Bryan Fein. All rights reserved.
//

#import "MapPin.h"

@interface MapPin ()


@end


@implementation MapPin


-(id)initWithTitle:(NSString *)title subtitle:(NSString *)subtitle location:(CLLocationCoordinate2D)location url:(NSString *)url;

{
    if (self = [super init])
    {
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = location;
        self.url = url;
        
    }
    return self;
    
}



@end
