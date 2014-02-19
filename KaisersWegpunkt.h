//
//  KaisersWegpunkt.h
//  Aufgabe 4
//
//  Created by Gregor Rosenbaum on 27.11.13.
//  Copyright (c) 2013 Gregor Rosenbaum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>

@interface KaisersWegpunkt : NSObject <MKAnnotation>

- (id) initWithCoordinate:(CLLocationCoordinate2D) coord title: (NSString * )tit;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, weak) NSString *title;

@end
