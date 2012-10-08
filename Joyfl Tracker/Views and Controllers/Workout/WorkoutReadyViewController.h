//
//  WorkoutReadyViewController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 21..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutSelectionView.h"
#import "WorkoutTypeModel.h"
#import "WorkoutTrackingViewController.h"

@interface WorkoutReadyViewController : UIViewController <UIScrollViewDelegate>
{
	UILabel *descriptionLabel;
	NSMutableArray *workoutTypes;
}

- (void)makeWorkoutTypes;
- (void)addWorkoutTypes:(UIScrollView *)scrollView;

@end