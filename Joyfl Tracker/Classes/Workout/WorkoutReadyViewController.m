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
		self.title = @"Start Workout";
		
		// Set TabBarItem
		self.tabBarItem.title = @"Workout";
		self.tabBarItem.image = [UIImage imageNamed:@"workout.png"];
		
		// Make description label
		UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
		descriptionLabel.text = @"text";
		descriptionLabel.textAlignment = UITextAlignmentCenter;
		
		// Add description label
		[self.view addSubview:descriptionLabel];
		[descriptionLabel release];
		
		// Make start button
		UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
		startButton.frame = CGRectMake(80, 340, 162, 42);
		[startButton setTitle:@"Start Workout" forState:UIControlStateNormal];
		[startButton setTitleColor:[UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
		[startButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateHighlighted];
		[startButton setBackgroundImage:[UIImage imageNamed:@"Button.png"] forState:UIControlStateNormal];
		[startButton setBackgroundImage:[UIImage imageNamed:@"ButtonHighlighted.png"] forState:UIControlStateHighlighted];
		[startButton addTarget:self action:@selector(startButtonDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		
		// Add start button
		[self.view addSubview:startButton];
		[startButton release];
		
		// Make selection scroll
		UIScrollView *selectionScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 80, 320, 240)];
		selectionScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		selectionScrollView.backgroundColor = [UIColor darkGrayColor];
		selectionScrollView.pagingEnabled = YES;
		selectionScrollView.showsHorizontalScrollIndicator = NO;
		selectionScrollView.delegate = self;
		
		// Make page control
		pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 320, 320, 20)];
		pageControl.numberOfPages = 5;
		[pageControl setBackgroundColor:[UIColor grayColor]];
		[self.view addSubview:pageControl];
		
		// Create dummy data
		int elementNum = 5;
		CGSize elementSize = CGSizeMake(320, 240);
		for(int i = 0; i < elementNum; i++)
		{
			UIView *subView = [[UIView alloc] init];
			subView.backgroundColor = [UIColor colorWithRed:i*40.0f/255.0f green:i*40.0f/255.0f blue:i*40.0f/255.0f alpha:1.0];
			subView.frame = CGRectMake(i * elementSize.width, 0, elementSize.width, elementSize.height);
			[selectionScrollView addSubview:subView];
			[subView release];
		}
		selectionScrollView.contentSize = CGSizeMake(elementNum * elementSize.width, elementSize.height);
		
		// Add selection scroll
		[self.view addSubview:selectionScrollView];
		[selectionScrollView release];
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
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	// It gives buffer: 40 pixels
	[pageControl setCurrentPage:(scrollView.contentOffset.x + 40) / 320];
}


#pragma mark -
#pragma mark ControlEventSelectors

- (void)startButtonDidTouchUpInside
{
	//SkinTestViewController *skinTestViewController = [[SkinTestViewController alloc] init];
	//[self.navigationController pushViewController:skinTestViewController animated:YES];
	//[skinTestViewController release];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Not yet!" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
}

@end
