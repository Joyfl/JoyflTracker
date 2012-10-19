//
//  ProfileManager.m
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 15..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "ProfileManager.h"

@implementation ProfileManager

@synthesize age, sex, height, weight;

+ (ProfileManager *)manager
{
	static ProfileManager *manager;
	if(!manager)
		manager = [[ProfileManager alloc] init];
	return manager;
}

- (id)init
{
	age = 25;
	sex = L(@"MALE");
	height = 170.0f;
	weight = 65.0f;
	return self;
}

@end