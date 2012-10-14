//
//  WorkoutEndViewController.h
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 11..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutModel.h"
#import "WorkoutTypeManager.h"

@interface WorkoutEndViewController : UITableViewController <UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate>
{
	WorkoutModel *workout;
	WorkoutTypeManager *manager;
	UILabel *typeLabel;
	UIImageView *typeIcon;
	UIActionSheet *actionSheet;
	UIPickerView *pickerView;
	UITextView *memo;
}

@property (nonatomic, retain) WorkoutModel *workout;
@property (nonatomic, retain) UILabel *typeLabel;
@property (nonatomic, retain) UIImageView *typeIcon;

@end
