//
//  NearbyViewController.h
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 20..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearbyViewList.h"

@interface NearbyViewController : UIViewController
{
    NearbyViewList *nearbyViewList;
}

@property (nonatomic, retain) NearbyViewList *nearbyViewList;

@end
