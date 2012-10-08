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
        // Custom initialization
		
		// Basic
		self.title = L(@"WORKOUT");
		
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
		UIScrollView *selectionScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(60, 0, 200, 200)];
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
		[self makeWorkoutTypes];
		[self addWorkoutTypes:selectionScrollView];
		
		// Make description label
		descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 320, 70)];
		descriptionLabel.text = [[workoutTypes objectAtIndex:0] typeName];
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

- (void)makeWorkoutTypes
{
	workoutTypes = [[NSMutableArray alloc] init];
	
	WorkoutTypeModel *typeRunning = [[WorkoutTypeModel alloc] init:0:L(@"TYPE_RUNNING"):IMAGE_TYPE_RUNNING];
	WorkoutTypeModel *typeWalking = [[WorkoutTypeModel alloc] init:1:L(@"TYPE_WALKING"):IMAGE_TYPE_WALKING];
	WorkoutTypeModel *typeHiking = [[WorkoutTypeModel alloc] init:2:L(@"TYPE_HIKING"):IMAGE_TYPE_HIKING];
	WorkoutTypeModel *typeCycling = [[WorkoutTypeModel alloc] init:3:L(@"TYPE_CYCLING"):IMAGE_TYPE_CYCLING];
	WorkoutTypeModel *typeSkiing = [[WorkoutTypeModel alloc] init:4:L(@"TYPE_SKIING"):IMAGE_TYPE_SKIING];
	WorkoutTypeModel *typeSkating = [[WorkoutTypeModel alloc] init:5:L(@"TYPE_SKATING"):IMAGE_TYPE_SKATING];
	WorkoutTypeModel *typeOther = [[WorkoutTypeModel alloc] init:6:L(@"TYPE_OTHER"):IMAGE_TYPE_OTHER];
	
	[workoutTypes addObject:typeRunning];
	[workoutTypes addObject:typeWalking];
	[workoutTypes addObject:typeHiking];
	[workoutTypes addObject:typeCycling];
	[workoutTypes addObject:typeSkiing];
	[workoutTypes addObject:typeSkating];
	[workoutTypes addObject:typeOther];
	
	[typeRunning release];
	[typeWalking release];
	[typeHiking release];
	[typeCycling release];
	[typeSkiing release];
	[typeSkating release];
	[typeOther release];
}

- (void)addWorkoutTypes:(UIScrollView *)scrollView
{
	int elementNum = [workoutTypes count];
	CGSize elementSize = CGSizeMake(200, 200);
	for(int i = 0; i < elementNum; i++)
	{
		UIImageView *imageView = [[UIImageView alloc] init];
		imageView.image = [[workoutTypes objectAtIndex:i] image];
		imageView.frame = CGRectMake(i * elementSize.width, 0, elementSize.width, elementSize.height);
		[scrollView addSubview:imageView];
		[imageView release];
	}
	scrollView.contentSize = CGSizeMake(elementNum * elementSize.width, elementSize.height);
}


#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	// It gives buffer: half pixels
	int index = ((scrollView.contentOffset.x + 100) / 200);
	if(index < 0) index = 0;
	if(index >= workoutTypes.count) index = workoutTypes.count - 1;
	descriptionLabel.text = [[workoutTypes objectAtIndex:index] typeName];
}


#pragma mark -
#pragma mark ControlEventSelectors

- (void)startButtonDidTouchUpInside
{
	WorkoutTrackingViewController *workoutTrackingViewController = [[WorkoutTrackingViewController alloc] init];
	workoutTrackingViewController.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:workoutTrackingViewController animated:YES];
	[workoutTrackingViewController release];
}

@end
