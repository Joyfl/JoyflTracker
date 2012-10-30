//
//  WorkoutManager.h
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 25..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorkoutModel.h"

@interface WorkoutManager : NSObject
{
	NSMutableArray *history;
}

@property (nonatomic, retain) NSMutableArray *history;

+ (WorkoutManager *)manager;
- (id)init;
- (void)load;
- (void)save;

@end