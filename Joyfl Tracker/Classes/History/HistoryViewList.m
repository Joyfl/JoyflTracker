//
//  HistoryViewList.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 20..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "HistoryViewList.h"

@implementation HistoryViewList

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setScrollEnabled:TRUE];
        [self setContentSize:CGSizeMake(320, 700)];
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
