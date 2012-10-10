//
//  WorkoutTypeModel.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 25..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorkoutTypeModel : NSObject
{
	NSInteger typeId;
	NSString *typeName;
	UIImage *image;
	UIImage *icon;
}

@property (nonatomic, assign) NSInteger typeId;
@property (nonatomic, retain) NSString *typeName;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) UIImage *icon;

@end