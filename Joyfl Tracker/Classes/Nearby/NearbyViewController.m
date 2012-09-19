//
//  NearbyViewController.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 20..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "NearbyViewController.h"

@interface NearbyViewController ()

@end

@implementation NearbyViewController

@synthesize nearbyViewList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        nearbyViewList = [[NearbyViewList alloc] init];
        [self setView:nearbyViewList];
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
