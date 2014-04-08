//
//  TrackViewController.m
//  iBeacons Demo
//
//  Created by M Newill on 27/09/2013.
//  Copyright (c) 2013 Mobient. All rights reserved.
//

#import "TrackViewController.h"

@interface TrackViewController ()

@end

@implementation TrackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.creatinq.slenderbeacon"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon1 = [[CLBeacon alloc] init];
    CLBeacon *beacon2 = [[CLBeacon alloc] init];
    CLBeacon *beacon3 = [[CLBeacon alloc] init];
    
    beacon1 = [beacons objectAtIndex:0];
    beacon2 = [beacons objectAtIndex:1];
    beacon3 = [beacons objectAtIndex:2];
    
    
    NSLog(@"1: %f", beacon1.accuracy);
    NSLog(@"2: %f", beacon2.accuracy);
    NSLog(@"3: %f", beacon3.accuracy);
    NSLog(@"------------------------");
    
    
    if(beacon1.accuracy < 0.8) {
        if([[NSString stringWithFormat:@"%@", beacon1.major] isEqualToString:@"16345"]) {
            [self.view setBackgroundColor:[UIColor purpleColor]];
        } else if([[NSString stringWithFormat:@"%@", beacon1.major] isEqualToString:@"31754"]) {
            [self.view setBackgroundColor:[UIColor greenColor]];
        } else if([[NSString stringWithFormat:@"%@", beacon1.major] isEqualToString:@"24196"]) {
            [self.view setBackgroundColor:[UIColor blueColor]];
        } else {
            [self.view setBackgroundColor:[UIColor whiteColor]];
        }
    } else {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
