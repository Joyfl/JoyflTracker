//
//  WorkoutTypeModel.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 25..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutTypeModel.h"

@implementation WorkoutTypeModel

@synthesize typeId, typeName, image;

- (id)init:(NSInteger)_typeId:(NSString *)_typeName:(NSString *)_image;
{
	typeId = _typeId;
	typeName = _typeName;
	image = [UIImage imageNamed:_image];
	return self;
}

@end