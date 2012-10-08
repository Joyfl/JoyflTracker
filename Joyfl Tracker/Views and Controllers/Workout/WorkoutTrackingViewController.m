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

@synthesize durationLabel, distanceLabel, calorieLabel, mapView, signalImage, pauseButton, resumeButton, endButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		// Basic
		self.title = L(@"TRACKING");
		
		// Make duration label
		durationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 107, 40)];
		durationLabel.textAlignment = UITextAlignmentCenter;
		[durationLabel setBackgroundColor:[UIColor cyanColor]];
		[self.view addSubview:durationLabel];
		[durationLabel release];
		
		// Make distance label
		distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake(107, 0, 107, 40)];
		distanceLabel.textAlignment = UITextAlignmentCenter;
		[distanceLabel setBackgroundColor:[UIColor grayColor]];
		[self.view addSubview:distanceLabel];
		[distanceLabel release];
		
		// Make calorie label
		calorieLabel = [[UILabel alloc] initWithFrame:CGRectMake(214, 0, 106, 40)];
		calorieLabel.textAlignment = UITextAlignmentCenter;
		[calorieLabel setBackgroundColor:[UIColor blueColor]];
		[self.view addSubview:calorieLabel];
		[calorieLabel release];
		
		// Make GoogleMap
		mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 40, 320, 280)];
		mapView.delegate = self;
		[self.view addSubview:mapView];
		[mapView release];
		
		// Make current button
		UIButton *currentButton = [UIButton buttonWithType:UIButtonTypeCustom];
		currentButton.frame = CGRectMake(40, 340, 30, 30);
		[currentButton setBackgroundColor:[UIColor redColor]];
		[self.view addSubview:currentButton];
		
		// Make signal image
		signalImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:IMAGE_WORKOUT_SIGNAL_IMAGE]];
		signalImage.frame = CGRectMake(260, 340, 30, 30);
		[self.view addSubview:signalImage];
		[signalImage release];
		
		// Make pause button
		pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
		pauseButton.frame = CGRectMake(80, 382, 162, 42);
		[pauseButton setTitle:L(@"BUTTON_WORKOUT_PAUSE") forState:UIControlStateNormal];
		[pauseButton setTitleColor:[UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
		[pauseButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateHighlighted];
		[pauseButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON] forState:UIControlStateNormal];
		[pauseButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON_HIGHLIGHTED] forState:UIControlStateHighlighted];
		[pauseButton addTarget:self action:@selector(pauseButtonDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:pauseButton];
		
		// Make resume button
		resumeButton = [UIButton buttonWithType:UIButtonTypeCustom];
		resumeButton.frame = CGRectMake(80, 382, 75, 42);
		[resumeButton setTitle:L(@"BUTTON_WORKOUT_RESUME") forState:UIControlStateNormal];
		[resumeButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON] forState:UIControlStateNormal];
		[resumeButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON_HIGHLIGHTED] forState:UIControlStateHighlighted];
		[resumeButton addTarget:self action:@selector(resumeButtonDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		resumeButton.hidden = YES;
		[self.view addSubview:resumeButton];
		
		// Make end button
		endButton = [UIButton buttonWithType:UIButtonTypeCustom];
		endButton.frame = CGRectMake(182, 382, 70, 42);
		[endButton setTitle:L(@"BUTTON_WORKOUT_END") forState:UIControlStateNormal];
		[endButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON] forState:UIControlStateNormal];
		[endButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON_HIGHLIGHTED] forState:UIControlStateHighlighted];
		[endButton addTarget:self action:@selector(endButtonDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		endButton.hidden = YES;
		[self.view addSubview:endButton];
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

#pragma mark -
#pragma mark ControlEventSelectors

- (void)pauseButtonDidTouchUpInside
{
	pauseButton.hidden = YES;
	resumeButton.hidden = NO;
	endButton.hidden = NO;
}

- (void)resumeButtonDidTouchUpInside
{
	pauseButton.hidden = NO;
	resumeButton.hidden = YES;
	endButton.hidden = YES;
}

- (void)endButtonDidTouchUpInside
{
	WorkoutEndViewController *workoutEndViewController = [[WorkoutEndViewController alloc] init];
	UINavigationController *workoutEndNavigationController = [[UINavigationController alloc] initWithRootViewController:workoutEndViewController];
	[workoutEndViewController release];
	[self presentModalViewController:workoutEndNavigationController animated:YES];
	[workoutEndNavigationController release];
}

@end
