//
//  WorkoutTypeModel.h
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 10..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkoutTypeModel.h"

@interface WorkoutTypeManager : NSObject
{
	NSMutableArray *types;
}

@property (nonatomic, retain) NSMutableArray *types;

+ (WorkoutTypeManager *)manager;
- (id)init;
- (void)makeWorkoutTypes;

@end