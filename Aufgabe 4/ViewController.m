//
//  ViewController.m
//  Aufgabe 4
//
//  Created by Gregor Rosenbaum on 27.11.13.
//  Copyright (c) 2013 Gregor Rosenbaum. All rights reserved.
//

#import "ViewController.h"
#import "KaisersWegpunkt.h"

@interface ViewController ()

@property (nonatomic) MKCoordinateRegion region;
@property NSArray* coordinates;
@end

@implementation ViewController
@synthesize map;
@synthesize distLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.map.delegate = self;
    [map setShowsUserLocation:YES];
    
    KaisersWegpunkt *wp1 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.504851, 13.337183) title:@"Internationale Spezialitäten"];
    KaisersWegpunkt *wp2 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.517437, 13.360214) title:@"Mannes Kiosk"];
    KaisersWegpunkt *wp3 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.517802, 13.380505) title:@"Edeka"];
    KaisersWegpunkt *wp4 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.517021, 13.390922) title:@"Zoohandlung Meier"];
    KaisersWegpunkt *wp5 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.521312, 13.407096) title:@"Getränkehandel Hofmann"];
    KaisersWegpunkt *wp6 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.517997, 13.376902) title:@"Burger King"];
    KaisersWegpunkt *wp7 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.517059, 13.357663) title:@"Bäreneck"];
    KaisersWegpunkt *wp8 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.514333, 13.348874) title:@"Media Markt"];
    KaisersWegpunkt *wp9 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.503536, 13.350265) title:@"Kaisers"];
    KaisersWegpunkt *wp10 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.50, 13.34) title:@"Universität"];
    KaisersWegpunkt *wp11 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.50, 13.33) title:@"Ali Baba"];
    KaisersWegpunkt *wp12 = [[KaisersWegpunkt alloc]initWithCoordinate:CLLocationCoordinate2DMake(52.50, 13.33) title:@"Reifenhandel Körich"];
    _coordinates = [NSArray arrayWithObjects:wp1,wp2,wp3,wp4,wp5,wp6,wp7,wp8,wp9,wp10, nil];

    [map addAnnotations:_coordinates];
        
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)upDateDistance : (KaisersWegpunkt*) wayPoint {
    CLLocation * wp  = [[CLLocation alloc] initWithLatitude:wayPoint.coordinate.latitude longitude:wayPoint.coordinate.longitude];
    CLLocation * userLoation = [[CLLocation alloc]initWithLatitude:map.userLocation.coordinate.latitude longitude:map.userLocation.coordinate.longitude];
    
    CLLocationDistance distance = [wp distanceFromLocation:userLoation];
        NSLog([NSString stringWithFormat: @"%4.0f", distance]);
    
    
    if  (distance < 20.0){
        return true;
    } else return false;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _region = MKCoordinateRegionMakeWithDistance([[userLocation location] coordinate], 1000, 1000);
    [map setRegion:_region];
    bool setLabel = false;
    for (int i = 0; i < [_coordinates count] && setLabel == false; i++) {
        setLabel = [self upDateDistance:_coordinates[i]] ;
        if (setLabel) {
            [distLabel setText:@"Das sollte klappen."];
        }
    }
    if (!setLabel) {
        [distLabel setText:@""];
    }
    
   }
@end
