//
//  MasterViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "MasterViewController.h"
#import "UIMasterViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    
    self.tableView.frame = CGRectMake(0, 0, 320, 1024);
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [[[UIView alloc] init] autorelease];
    self.tableView.contentInset = UIEdgeInsetsMake(15.0,15.0,0,-15.0);
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MasterCellIdentifier = @"MasterCell";

    UIMasterViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MasterCellIdentifier];
    
    if (cell == nil) {
        cell = [[[UIMasterViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MasterCellIdentifier] autorelease];
    }

    cell.primaryLabel.text = [NSString stringWithFormat:@"Chapitre %i", indexPath.row + 1];
    
    switch (indexPath.row) {
        case 0:
            cell.secondaryLabel.text = @"Introduction";
            //cell.myImageView.image = [UIImage imageNamed:@"meeting_color.png"];
            break;
        case 1:
            cell.secondaryLabel.text = @"Conseils Techniques";
            //cell.myImageView.image = [UIImage imageNamed:@"call_color.png"];
            break;
        case 2:
            cell.secondaryLabel.text = @"Le top à manches kimono lorem ipsum";
            //cell.myImageView.image = [UIImage imageNamed:@"calendar_color.png"];
            break;
        case 3:
            cell.secondaryLabel.text = @"La cape cache-cœur";
            //cell.myImageView.image = [UIImage imageNamed:@"call_color.png"];
            break;
        case 4:
            cell.secondaryLabel.text = @"La robe « Y » sur deux lignes svp";
            //cell.myImageView.image = [UIImage imageNamed:@"calendar_color.png"];
            break;
        default:
            break;
    }
    
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor = [UIColor colorWithRed:0.0 green:0.64 blue:0.80 alpha:1];
    myBackView.layer.cornerRadius = 4;
    cell.selectedBackgroundView = myBackView;
    [myBackView release];
    
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
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
}

@end
