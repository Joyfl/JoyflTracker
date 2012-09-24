//
//  WorkoutTrackingViewController.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 21..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutTrackingViewController.h"

@interface WorkoutTrackingViewController ()

@end

@implementation WorkoutTrackingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		// Basic
		self.title = @"Tracking";
		
		// Set view
		WorkoutTrackingView *workoutTrackingView = [[WorkoutTrackingView alloc] init];
		[self setView:workoutTrackingView];
		[workoutTrackingView release];
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
