//
//  WorkoutManager.m
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 25..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutManager.h"

@implementation WorkoutManager

@synthesize history;

+ (WorkoutManager *)manager
{
	static WorkoutManager *manager;
	if(!manager)
		manager = [[WorkoutManager alloc] init];
	return manager;
}

- (id)init
{
	self = [super init];
	history = [[NSMutableArray alloc] init];
	return self;
}

- (void)load
{
	
}

- (void)save
{
	
}

@end
