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
	NSInteger sexIndex;
	NSInteger heightInt;
	NSInteger heightDec;
	NSInteger weightInt;
	NSInteger weightDec;
}

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) NSInteger sexIndex;
@property (nonatomic, assign) NSInteger heightInt;
@property (nonatomic, assign) NSInteger heightDec;
@property (nonatomic, assign) NSInteger weightInt;
@property (nonatomic, assign) NSInteger weightDec;

+ (ProfileManager *)manager;
- (id)init;
- (void)load;
- (void)save;
- (NSString *)sex;

@end
