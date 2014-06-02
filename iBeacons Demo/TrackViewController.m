//
//  TrackViewController.m
//  iBeacons Demo
//
//  Created by M Newill on 27/09/2013.
//  Copyright (c) 2013 Mobient. All rights reserved.
//

#import "TrackViewController.h"

@interface TrackViewController () {
    NSString *lastMajor;
    
    int timerInt;
    NSTimer *slenderTimer;
    BOOL shouldTimerFire;
}

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
<<<<<<< HEAD

=======
    
    //Timers
    timerInt = 0;
    slenderTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(startSlender) userInfo:nil repeats:YES];
    
>>>>>>> FETCH_HEAD
    lastMajor = @"";
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
    
    beacon1 = [beacons objectAtIndex:0];
    
    
    // Check of dichtstbijzijnde bacon anders is dan laatste bacon
    if([lastMajor isEqualToString:[NSString stringWithFormat:@"%@", beacon1.major]]) {
        // Staat nog bij oude bacon
        NSLog(@"Oude beacon");
    } else {
        // Nieuwe bacon dichtstbijzijnde
        NSLog(@"Nieuwe beacon");
        
        lastMajor = [NSString stringWithFormat:@"%@", beacon1.major];
    }
    
    
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

- (void) startSlender {
    if (shouldTimerFire) {
        
    }
}

- (void) resetSlender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
