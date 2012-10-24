//
//  ProfileManager.m
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 15..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "ProfileManager.h"

@implementation ProfileManager

@synthesize age, sexIndex, heightInt, heightDec, weightInt, weightDec;

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
	sexIndex = 0;
	heightInt = 170;
	heightDec = 0;
	weightInt = 65;
	weightDec = 0;
	return self;
}

- (void)save
{
	
}

- (NSString *)sex
{
	if(sexIndex == 0) return L(@"MALE");
	else return L(@"FEMALE");
}

@end