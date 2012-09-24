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
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIView *) hitTest:(CGPoint) point withEvent:(UIEvent *)event {
	if ([self pointInside:point withEvent:event]) {
		if(self.scrollView)
			return self.scrollView;
		else return nil;
	}
	return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
