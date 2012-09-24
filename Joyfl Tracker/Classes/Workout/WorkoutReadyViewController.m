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
		//self.title = NSLocalizedString(@"WORKOUT", nil);
		self.title = L(@"WORKOUT");
		//@"Start Workout";
		
		// Set TabBarItem
		self.tabBarItem.title = L(@"WORKOUT");;
		self.tabBarItem.image = [UIImage imageNamed:@"workout.png"];
		
		// Make title label
		UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 90)];
		titleLabel.text = L(@"MESSAGE_START_WORKOUT");
		titleLabel.textAlignment = UITextAlignmentCenter;
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
		selectionView.scrollView = selectionScrollView;
		[selectionView addSubview:selectionScrollView];
		[selectionScrollView release];
		[self.view addSubview:selectionView];
		[selectionView release];
		
		// Create dummy data
		int elementNum = 5;
		CGSize elementSize = CGSizeMake(200, 200);
		for(int i = 0; i < elementNum; i++)
		{
			UIView *subView = [[UIView alloc] init];
			subView.backgroundColor = [UIColor colorWithRed:i*40.0f/255.0f green:i*40.0f/255.0f blue:i*40.0f/255.0f alpha:1.0];
			subView.frame = CGRectMake(i * elementSize.width, 0, elementSize.width, elementSize.height);
			[selectionScrollView addSubview:subView];
			[subView release];
		}
		selectionScrollView.contentSize = CGSizeMake(elementNum * elementSize.width, elementSize.height);
		
		// Make description label
		descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 280, 320, 70)];
		descriptionLabel.text = @"page 1";
		descriptionLabel.textAlignment = UITextAlignmentCenter;
		[self.view addSubview:descriptionLabel];
		[descriptionLabel release];
		
		// Make start button
		UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
		startButton.frame = CGRectMake(80, 340, 162, 42);
		[startButton setTitle:L(@"BUTTON_START_WORKOUT") forState:UIControlStateNormal];
		[startButton setTitleColor:[UIColor colorWithRed:90.0f/255.0f green:90.0f/255.0f blue:90.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
		[startButton setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0] forState:UIControlStateHighlighted];
		[startButton setBackgroundImage:[UIImage imageNamed:@"Button.png"] forState:UIControlStateNormal];
		[startButton setBackgroundImage:[UIImage imageNamed:@"ButtonHighlighted.png"] forState:UIControlStateHighlighted];
		[startButton addTarget:self action:@selector(startButtonDidTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:startButton];
		[startButton release];
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
	// [pageControl setCurrentPage:(scrollView.contentOffset.x + 40) / 200];
	
	// dummy string
	if(scrollView.contentOffset.x >= 240)
		descriptionLabel.text = @"page 2";
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
