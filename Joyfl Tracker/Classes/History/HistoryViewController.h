//
//  HistoryViewController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 13..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HistoryViewList.h"

@interface HistoryViewController : UIViewController
{
    HistoryViewList *historyViewList;
}

@property (nonatomic, retain) HistoryViewList *historyViewList;

@end
