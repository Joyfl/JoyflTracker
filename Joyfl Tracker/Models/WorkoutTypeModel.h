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
}

@property (nonatomic, assign) NSInteger typeId;
@property (nonatomic, retain) NSString *typeName;
@property (nonatomic, retain) UIImage *image;

- (id)init:(NSInteger)_typeId:(NSString *)_typeName:(NSString *)_image;

@end