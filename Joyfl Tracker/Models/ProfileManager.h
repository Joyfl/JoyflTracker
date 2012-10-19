//
//  ProfileManager.h
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 15..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileManager : NSObject
{
	NSInteger age;
	NSString *sex;
	CGFloat height;
	CGFloat weight;
	
	
}

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat weight;

+ (ProfileManager *)manager;
- (id)init;

@end
