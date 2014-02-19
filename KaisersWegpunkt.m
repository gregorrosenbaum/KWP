//
//  KaisersWegpunkt.m
//  Aufgabe 4
//
//  Created by Gregor Rosenbaum on 27.11.13.
//  Copyright (c) 2013 Gregor Rosenbaum. All rights reserved.
//

#import "KaisersWegpunkt.h"

@implementation KaisersWegpunkt

@synthesize coordinate, title;

- (id) initWithCoordinate:(CLLocationCoordinate2D)coord title:(NSString *)tit
{
    self = [super init];
    if (self) {
        self->coordinate = coord;
        self.title = tit;
    }
    return self;
}

- (id) init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(52.50, 13.33) title: @"Werners Hundesalon"];
}

@end
