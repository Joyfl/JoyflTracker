//
//  WorkoutModel.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 10. 2..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutModel.h"

@implementation WorkoutModel

@synthesize workoutId, userId, typeId, userName, date, thumbnail, route, duration, distance, calorie, memo, speed, averageSpeed, maximumSpeed;

- (id)init
{
	self = [super init];
	memo = @"";
	averageSpeed = 0;
	maximumSpeed = 0;
	return self;
}

@end