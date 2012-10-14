//
//  WorkoutSelectionView.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 24..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutSelectionView.h"

@implementation WorkoutSelectionView

@synthesize scrollView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}


#pragma mark - Member Functions

- (UIView *)hitTest:(CGPoint) point withEvent:(UIEvent *)event {
	if ([self pointInside:point withEvent:event]) {
		if(scrollView) return scrollView;
		else return nil;
	}
	return nil;
}

@end
