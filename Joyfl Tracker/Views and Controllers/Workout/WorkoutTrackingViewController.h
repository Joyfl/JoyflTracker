//
//  WorkoutTrackingViewController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 21..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WorkoutEndViewController.h"

@interface WorkoutTrackingViewController : UIViewController <MKMapViewDelegate>
{
	UILabel *durationLabel;
	UILabel *distanceLabel;
	UILabel *calorieLabel;
	MKMapView *mapView;
	UIImageView *signalImage;
	UIButton *pauseButton;
	UIButton *resumeButton;
	UIButton *endButton;
}

@property (nonatomic, retain) UILabel *durationLabel;
@property (nonatomic, retain) UILabel *distanceLabel;
@property (nonatomic, retain) UILabel *calorieLabel;
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) UIImageView *signalImage;
@property (nonatomic, retain) UIButton *pauseButton;
@property (nonatomic, retain) UIButton *resumeButton;
@property (nonatomic, retain) UIButton *endButton;

@end