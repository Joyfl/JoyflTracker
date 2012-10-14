//
//  WorkoutTypeManager.m
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 10..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutTypeManager.h"

@implementation WorkoutTypeManager

@synthesize types;

+ (WorkoutTypeManager *)manager
{	
	static WorkoutTypeManager *manager;
	if(!manager)
		manager = [[WorkoutTypeManager alloc] init];
	return manager;
}

- (id)init
{
	if(types == nil)
		[self makeWorkoutTypes];
	return self;
}

- (void)makeWorkoutTypes
{
	types = [[NSMutableArray alloc] initWithCapacity:4];
	
	WorkoutTypeModel *typeRunning = [[WorkoutTypeModel alloc] init];
	typeRunning.typeId = 0;
	typeRunning.typeName = L(@"TYPE_RUNNING");
	typeRunning.image = [UIImage imageNamed:IMAGE_TYPE_RUNNING];
	typeRunning.icon = [UIImage imageNamed:ICON_TYPE_RUNNING];
	
	WorkoutTypeModel *typeWalking = [[WorkoutTypeModel alloc] init];
	typeWalking.typeId = 1;
	typeWalking.typeName = L(@"TYPE_WALKING");
	typeWalking.image = [UIImage imageNamed:IMAGE_TYPE_WALKING];
	typeWalking.icon = [UIImage imageNamed:ICON_TYPE_WALKING];
	
	WorkoutTypeModel *typeCycling = [[WorkoutTypeModel alloc] init];
	typeCycling.typeId = 2;
	typeCycling.typeName = L(@"TYPE_CYCLING");
	typeCycling.image = [UIImage imageNamed:IMAGE_TYPE_CYCLING];
	typeCycling.icon = [UIImage imageNamed:ICON_TYPE_CYCLING];
	
	WorkoutTypeModel *typeOther = [[WorkoutTypeModel alloc] init];
	typeOther.typeId = 3;
	typeOther.typeName = L(@"TYPE_OTHER");
	typeOther.image = [UIImage imageNamed:IMAGE_TYPE_OTHER];
	typeOther.icon = [UIImage imageNamed:ICON_TYPE_OTHER];
	
	[types addObject:typeRunning];
	[types addObject:typeWalking];
	[types addObject:typeCycling];
	[types addObject:typeOther];
	
	[typeRunning release];
	[typeWalking release];
	[typeCycling release];
	[typeOther release];
}

@end
