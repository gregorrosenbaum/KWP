//
//  ViewController.h
//  Aufgabe 4
//
//  Created by Gregor Rosenbaum on 27.11.13.
//  Copyright (c) 2013 Gregor Rosenbaum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *distLabel;
@property (weak, nonatomic) IBOutlet MKMapView *map;


@end
