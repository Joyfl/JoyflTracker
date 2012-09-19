//
//  WorkoutViewController.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 13..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutViewController.h"

@interface WorkoutViewController ()

@end

@implementation WorkoutViewController

@synthesize workoutViewReady;
@synthesize workoutViewTracking;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // Set TabBarItem
        [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Workout" image:[UIImage imageNamed:@"run.png"] tag:1]];
        [[self tabBarItem] setBadgeValue:@"3"];
        [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"workout_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"workout.png"]];
        
        // Set first view as WorkoutViewReady
        workoutViewReady = [[WorkoutViewReady alloc] init];
        [self setView:workoutViewReady];
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
