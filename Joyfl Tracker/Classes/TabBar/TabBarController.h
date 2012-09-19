//
//  TabBarController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 13..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutViewController.h"
#import "HistoryViewController.h"
#import "NearbyViewController.h"
#import "ProfileViewcontroller.h"

@interface TabBarController : UITabBarController
{
    WorkoutViewController *workoutViewController;
    HistoryViewController *historyViewController;
    NearbyViewController *nearbyViewController;
    ProfileViewController *profileViewController;
}

@property (nonatomic, retain) WorkoutViewController *workoutViewController;
@property (nonatomic, retain) HistoryViewController *historyViewController;
@property (nonatomic, retain) NearbyViewController *nearbyViewController;
@property (nonatomic, retain) ProfileViewController *profileViewController;

@end
