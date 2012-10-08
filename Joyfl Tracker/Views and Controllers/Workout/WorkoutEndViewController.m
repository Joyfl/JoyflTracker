//
//  WorkoutEndViewController.m
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 6..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutEndViewController.h"

@interface WorkoutEndViewController ()

@end

@implementation WorkoutEndViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
		
		UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonClicked)];
		self.navigationItem.rightBarButtonItem = doneButton;
		
		[self.view setBackgroundColor:[UIColor whiteColor]];
		[doneButton release];
		
		UITableView *menu = [[UITableView alloc] initWithFrame:CGRectMake(20, 20, 200, 200) style:UITableViewStyleGrouped];
		
		
		[self.view addSubview:menu];
		[menu release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark ControlEventSelectors

- (void)doneButtonClicked
{
	UITabBarController *tabBarController = (UITabBarController *)self.presentingViewController;
	[(UINavigationController *)tabBarController.selectedViewController popViewControllerAnimated:NO];	
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
