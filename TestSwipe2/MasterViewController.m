//
//  MasterViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "MasterViewController.h"
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
    static NSString *ProductCellIdentifier = @"ProductCellIdentifier";
    
    UILabel *mainLabel, *secondLabel;
    UIImageView *image, *separator;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProductCellIdentifier];
        
        mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 35.0, 170.0, 18.0)];
        mainLabel.tag = 1;
        mainLabel.font = [UIFont boldSystemFontOfSize:16];
        mainLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        mainLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:mainLabel];
        
        secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 60.0, 170.0, 32.0)];
        secondLabel.tag = 2;
        secondLabel.font = [UIFont systemFontOfSize:14];
        secondLabel.textColor = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1.0];
        secondLabel.backgroundColor = [UIColor clearColor];
        secondLabel.lineBreakMode = NSLineBreakByWordWrapping;
        secondLabel.numberOfLines = 0;
        
        CGRect currentFrame = secondLabel.frame;
        CGSize max = CGSizeMake(secondLabel.frame.size.width, 170);
        CGSize expected = [@"Lorem ipsum et dolor sit amet" sizeWithFont:secondLabel.font constrainedToSize:max lineBreakMode:secondLabel.lineBreakMode];
        currentFrame.size.height = expected.height;
        secondLabel.frame = currentFrame;
        
        [cell.contentView addSubview:secondLabel];
        
        separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separator.png"]];
        separator.tag = 3;
        separator.frame = CGRectMake(12, 129, 265.0, 2.0);
        //[cell.contentView addSubview:separator];
        
        image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chapter.png"]];
        image.tag = 4;
        image.frame = CGRectMake(12, 12, 95, 105);
        image.layer.masksToBounds = NO;
        image.layer.shadowOffset = CGSizeMake(0, 0);
        image.layer.shadowRadius = 5;
        image.layer.shadowOpacity = 0.5;
        image.layer.shouldRasterize = YES;
        image.layer.rasterizationScale = [UIScreen mainScreen].scale;
        image.layer.shadowPath = [UIBezierPath bezierPathWithRect:image.bounds].CGPath;
        
        [cell.contentView addSubview:image];
        
        
    } else {
        mainLabel = (UILabel *)[cell.contentView viewWithTag:1];
        secondLabel = (UILabel *)[cell.contentView viewWithTag:2];
        separator = (UIImageView *)[cell.contentView viewWithTag:3];
        image = (UIImageView *)[cell.contentView viewWithTag:4];
    }
    
    mainLabel.text = @"Chapter 3";
    secondLabel.text = @"Lorem ipsum et dolor sit amet";
    
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
