//
//  WorkoutModel.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 10. 2..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkoutModel : NSObject
{
	NSInteger workoutId;
	NSInteger userId;
	NSInteger typeId;
	
	NSString *userName;
	NSString *date;
	UIImage *thumbnail;
	
	NSMutableArray *route;
	NSTimeInterval duration;
	CGFloat distance;
	CGFloat calorie;
	
	NSString *memo;
	
	NSMutableArray *speed;
	CGFloat averageSpeed;
	CGFloat maximumSpeed;
}

@property (nonatomic, assign) NSInteger workoutId;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, assign) NSInteger typeId;

@property (nonatomic, retain) NSString *userName;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) UIImage *thumbnail;

@property (nonatomic, retain) NSMutableArray *route;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) CGFloat distance;
@property (nonatomic, assign) CGFloat calorie;

@property (nonatomic, retain) NSString *memo;

@property (nonatomic, retain) NSMutableArray *speed;
@property (nonatomic, assign) CGFloat averageSpeed;
@property (nonatomic, assign) CGFloat maximumSpeed;

- (id)init;

@end
