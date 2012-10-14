//
//  WorkoutReadyViewController.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 21..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutReadyViewController.h"

@interface WorkoutReadyViewController ()

@end

@implementation WorkoutReadyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
		// Basic
		self.title = L(@"WORKOUT");
		manager = [WorkoutTypeManager manager];
		
		// Set background
		UIImageView *backgroundImageView = [[UIImageView alloc] init];
		backgroundImageView.image = [UIImage imageNamed:IMAGE_WORKOUT_BACKGROUND];
		backgroundImageView.frame = CGRectMake(0, 0, 320, 480);
		[self.view addSubview:backgroundImageView];
		[backgroundImageView release];
		
		// Set TabBarItem
		self.tabBarItem.title = L(@"WORKOUT");
		//self.tabBarItem.image = [UIImage imageNamed:IMAGE_TABBAR_ITEM_WORKOUT];
		
		// Make title label
		UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
		titleLabel.text = L(@"MESSAGE_START_WORKOUT");
		titleLabel.textAlignment = UITextAlignmentCenter;
		[titleLabel setBackgroundColor:[UIColor clearColor]];
		[self.view addSubview:titleLabel];
		[titleLabel release];
		
		// Make selection scroll view
		selectionScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(60, 0, 200, 200)];
		selectionScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		selectionScrollView.pagingEnabled = YES;
		selectionScrollView.showsHorizontalScrollIndicator = NO;
		selectionScrollView.delegate = self;
		selectionScrollView.clipsToBounds = NO;
		
		// Make selection view
		WorkoutSelectionView *selectionView = [[WorkoutSelectionView alloc] initWithFrame:CGRectMake(0, 80, 320, 200)];
		selectionView.clipsToBounds = YES;
		selectionView.scrollView = selectionScrollView;
		[selectionView addSubview:selectionScrollView];
		[selectionScrollView release];
		[self.view addSubview:selectionView];
		[selectionView release];
		
		// Create data
		[self addWorkoutTypes];
		
		// Make description label
		descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 320, 70)];
		descriptionLabel.text = [[manager.types objectAtIndex:0] typeName];
		descriptionLabel.textAlignment = UITextAlignmentCenter;
		[descriptionLabel setBackgroundColor:[UIColor clearColor]];
		[self.view addSubview:descriptionLabel];
		[descriptionLabel release];
		
		// Make start button
		UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
		startButton.frame = CGRectMake(80, 340, 162, 42);
		[startButton setTitle:L(@"BUTTON_WORKOUT_START") forState:UIControlStateNormal];
		[startButton setTitleColor:[UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
		[startButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateHighlighted];
		[startButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON] forState:UIControlStateNormal];
		[startButton setBackgroundImage:[UIImage imageNamed:IMAGE_WORKOUT_START_BUTTON_HIGHLIGHTED] forState:UIControlStateHighlighted];
		[startButton addTarget:self action:@selector(startButtonDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:startButton];
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


#pragma mark - Member Functions

- (void)addWorkoutTypes
{
	int elementNum = [manager.types count];
	CGSize elementSize = CGSizeMake(200, 200);
	for(int i = 0; i < elementNum; i++)
	{
		UIImageView *imageView = [[UIImageView alloc] init];
		imageView.image = [[manager.types objectAtIndex:i] image];
		imageView.frame = CGRectMake(i * elementSize.width, 0, elementSize.width, elementSize.height);
		[selectionScrollView addSubview:imageView];
		[imageView release];
	}
	selectionScrollView.contentSize = CGSizeMake(elementNum * elementSize.width, elementSize.height);
}


#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	// It gives buffer: half pixels
	int index = ((scrollView.contentOffset.x + 100) / 200);
	if(index < 0) index = 0;
	if(index >= [manager.types count]) index = [manager.types count] - 1;
	descriptionLabel.text = [[manager.types objectAtIndex:index] typeName];
}


#pragma mark - Control Event Selectors

- (void)startButtonDidTouchUpInside
{
	int index = ((selectionScrollView.contentOffset.x + 100) / 200);
	if(index < 0) index = 0;
	if(index >= [manager.types count]) index = [manager.types count] - 1;
	WorkoutTrackingViewController *workoutTrackingViewController = [[WorkoutTrackingViewController alloc] init];
	workoutTrackingViewController.hidesBottomBarWhenPushed = YES;
	[workoutTrackingViewController setWorkoutType:index];
	[self.navigationController pushViewController:workoutTrackingViewController animated:YES];
	[workoutTrackingViewController release];
}


@end
