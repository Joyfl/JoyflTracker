//
//  HistoryDetailViewController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 21..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutTypeManager.h"
#import "WorkoutModel.h"

@interface HistoryDetailViewController : UIViewController
{
	WorkoutModel *workout;
	WorkoutTypeManager *manager;
}

@end
