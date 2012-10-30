//
//  HistoryListViewController.m
//  Joyfl Tracker
//
//  Created by 설 진석 on 12. 9. 21..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "HistoryListViewController.h"

@interface HistoryListViewController ()

@end

@implementation HistoryListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
		
		// Basic
		self.title = L(@"HISTORY");
		typeManager = [WorkoutTypeManager manager];
		workoutManager = [WorkoutManager manager];
		
		// Set TabBarItem
		self.tabBarItem.title = L(@"HISTORY");
		//self.tabBarItem.image = [UIImage imageNamed:@"history.png"];
		
		// Create dummy
		WorkoutModel *temp = [[WorkoutModel alloc] init];
		temp.typeId = 0;
		temp.duration = 0;
		temp.distance = 0;
		temp.calorie = 0;
		temp.date = @"07 Feb 2012";
		temp.memo = @"asdf";
		[workouts addObject:temp];
		[temp release];
		temp = [[WorkoutModel alloc] init];
		temp.typeId = 0;
		temp.duration = 0;
		temp.distance = 0;
		temp.calorie = 0;
		temp.date = @"07 Feb 2012";
		temp.memo = @"asdf";
		[workouts addObject:temp];
		[temp release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [workouts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    // Configure the cell...
	if(cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 400)];
		[cell autorelease];
	}
	
	UILabel *temp1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 20)];
	temp1.text = ((WorkoutModel *)[workouts objectAtIndex:[indexPath row]]).date;
	
	[cell addSubview:temp1];
	
	[temp1 release];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat result;
	
    switch ([indexPath row])
    {
        case 0:
        {
            result = 400.0f;
            break;
        }
        case 1:
        {
            result = 300.0f;
            break;
        }
		default:
			result = 0;
			break;
    }
    return result;
}

@end
