//
//  WorkoutViewController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 13..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutViewReady.h"
#import "WorkoutViewTracking.h"

@interface WorkoutViewController : UIViewController
{
    WorkoutViewReady *workoutViewReady;
    WorkoutViewTracking *workoutViewTracking;
}

@property (nonatomic, retain) WorkoutViewReady *workoutViewReady;
@property (nonatomic, retain) WorkoutViewTracking *workoutViewTracking;

@end
