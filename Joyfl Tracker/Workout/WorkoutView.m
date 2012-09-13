//
//  WorkoutView.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 13..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutView.h"

@implementation WorkoutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGRect labelFrame = CGRectMake(50, 50, 200, 30);
        UILabel *hello = [[UILabel alloc] initWithFrame: labelFrame];
        hello.text = [[NSString alloc] initWithString:@"workout"];
        [self addSubview:hello];
    }
    return self;
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
