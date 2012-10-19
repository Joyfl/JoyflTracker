//
//  WorkoutEndViewController.m
//  Joyfl Tracker
//
//  Created by theeluwin on 12. 10. 11..
//  Copyright (c) 2012년 연세대학교. All rights reserved.
//

#import "WorkoutEndViewController.h"

@interface WorkoutEndViewController ()

@end

@implementation WorkoutEndViewController

@synthesize workout, typeIcon, typeLabel;

enum
{
	rowType = 0,
	rowMemo = 1
};

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
	
	// Basic
	manager = [WorkoutTypeManager manager];
	
	// Make done button
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:L(@"BUTTON_DONE") style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
    return self;
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	int row = [indexPath row];
	
	// Type
	if(row == rowType)
	{
		typeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(7, 7, 30, 30)];
		typeIcon.image = [[manager.types objectAtIndex:workout.typeId] icon];
		typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 7, 200, 32)];
		typeLabel.backgroundColor = [UIColor clearColor];
		typeLabel.text = [[manager.types objectAtIndex:workout.typeId] typeName];
		typeLabel.font = [UIFont systemFontOfSize:20];
		[cell.contentView addSubview:typeIcon];
		[cell.contentView addSubview:typeLabel];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	
	// Memo
	else if(row == rowMemo)
	{
		memo = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 75)];
		memo.backgroundColor = [UIColor clearColor];
		memo.text = L(@"MESSAGE_WORKOUT_MEMO");
		memo.textColor = [UIColor lightGrayColor];
		memo.font = [UIFont systemFontOfSize:17];
		memo.editable = YES;
		memo.delegate = self;
		memo.returnKeyType = UIReturnKeyDone;
		[cell.contentView addSubview:memo];
		[memo release];
	}
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{	
	int row = [indexPath row];
	if(row == rowType)
	{
		actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
		[actionSheet setActionSheetStyle:UIActionSheetStyleDefault];
		actionSheet.delegate = self;
		
		pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 0, 0)];
		pickerView.showsSelectionIndicator = YES;
		pickerView.dataSource = self;
		pickerView.delegate = self;
		[pickerView selectRow:workout.typeId inComponent:0 animated:NO];
		[actionSheet addSubview:pickerView];
		[pickerView release];
		
		UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:L(@"BUTTON_DONE")]];
		closeButton.momentary = YES;
		closeButton.frame = CGRectMake(260, 7, 50, 30);
		closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
		closeButton.tintColor = [UIColor brownColor];
		[closeButton addTarget:self action:@selector(dismissActionSheet) forControlEvents:UIControlEventValueChanged];
		[actionSheet addSubview:closeButton];
		[closeButton release];
		
		[actionSheet showInView:self.view];
		[actionSheet setBounds:CGRectMake(0, 0, 320, 480)];
		
		[memo resignFirstResponder];
	}
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([indexPath row] == rowMemo) return 85;
	return 44;
}


#pragma mark - Control Event Selectors

- (void)doneButtonPressed
{
	UITabBarController *tabBarController = (UITabBarController *)self.presentingViewController;
	[(UINavigationController *)tabBarController.selectedViewController popToRootViewControllerAnimated:NO];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissActionSheet
{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}


#pragma mark - PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [manager.types count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[manager.types objectAtIndex:row] typeName];
}


#pragma mark - PickerView Delegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	workout.typeId = row;
	typeIcon.image = [[manager.types objectAtIndex:row] icon];
	typeLabel.text = [[manager.types objectAtIndex:row] typeName];
}


#pragma mark - TextView Delegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	if([text isEqualToString:@"\n"])
	{
		[textView resignFirstResponder];
		return NO;
	}
	NSString *temp = [textView.text stringByReplacingCharactersInRange:range withString:text];
	CGSize tallerSize = CGSizeMake(textView.frame.size.width - 15, textView.frame.size.height + 44);
	CGSize newSize = [temp sizeWithFont:textView.font constrainedToSize:tallerSize lineBreakMode:UILineBreakModeWordWrap];
	if(newSize.height > textView.frame.size.height) return NO;
	else return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
	if(textView.text.length > 0 && textView.textColor == [UIColor blackColor]) return YES;
	textView.text = @"";
	textView.textColor = [UIColor blackColor];
	return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
	if(textView.text.length > 0 && textView.textColor == [UIColor blackColor]) return YES;
	textView.text = L(@"MESSAGE_WORKOUT_MEMO");
	textView.textColor = [UIColor lightGrayColor];
	return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
	if(textView.text.length == 0)
	{
		textView.textColor = [UIColor lightGrayColor];
		textView.text = L(@"MESSAGE_WORKOUT_MEMO");
		[textView resignFirstResponder];
	}
}


@end
