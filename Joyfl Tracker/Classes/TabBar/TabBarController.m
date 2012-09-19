//
//  TabBarController.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 13..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

@synthesize workoutViewController;
@synthesize historyViewController;
@synthesize nearbyViewController;
@synthesize profileViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[self tabBar] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg.png"]];
        [[self tabBar] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
        
        workoutViewController = [[WorkoutViewController alloc] init];
        historyViewController = [[HistoryViewController alloc] init];
        nearbyViewController = [[NearbyViewController alloc] init];
        profileViewController = [[ProfileViewController alloc] init];
        
        NSArray *controllers = [[NSArray alloc] initWithObjects:workoutViewController, historyViewController, nearbyViewController, profileViewController, nil];
        [self setViewControllers:controllers];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
