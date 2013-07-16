//
//  DetailViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, readwrite, strong) UIPanGestureRecognizer *panGR;
@end

@implementation DetailViewController

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
    
    self.tableView.frame = CGRectMake(320, 0, 1024, 1024);
    
    self.tableView.layer.masksToBounds = NO;
    self.tableView.layer.shadowOffset = CGSizeMake(0, 0);
    self.tableView.layer.shadowRadius = 10;
    self.tableView.layer.shadowOpacity = 0.5;
    self.tableView.layer.shouldRasterize = YES;
    self.tableView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.tableView.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.tableView.bounds].CGPath;
    
    _panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    _panGR.maximumNumberOfTouches = 1;
    _panGR.delegate = self;
    
    [self.tableView addGestureRecognizer:_panGR];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ProductCellIdentifier = @"ProductCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProductCellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [NSString stringWithFormat:@"Empty Cell %d", indexPath.row];
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


#pragma mark - UIGestureRecognizer delegate interface

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStatePossible: {
            break;
        }
            
        case UIGestureRecognizerStateBegan: {
            break;
        }
            
        case UIGestureRecognizerStateChanged: {
            CGFloat trx = [gestureRecognizer translationInView:self.tableView].x;
            
            self.tableView.frame = CGRectOffset(self.tableView.frame, trx, 0);
            //_view3.frame = CGRectOffset(_view3.frame, trx, 0);
            [gestureRecognizer setTranslation:CGPointZero inView:self.tableView];
            
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            CGFloat v = [gestureRecognizer velocityInView:self.tableView].x;
            
            if (self.tableView.frame.origin.x >= 320) {
                [UIView animateWithDuration:0.15 animations:^{
                    CGRect frame = self.tableView.frame;
                    frame.origin.x = 320;
                    self.tableView.frame = frame;
                    //CGRect frame3 = self.tableView.frame;
                    //frame3.origin.x = 768;
                    //self.tableView.frame = frame3;
                }];
            } else {
                if (v < 0) {
                    [UIView animateWithDuration:0.15 animations:^{
                        CGRect frame2 = self.tableView.frame;
                        frame2.origin.x = 0;
                        self.tableView.frame = frame2;
                        //CGRect frame3 = _view3.frame;
                        //frame3.origin.x = 448;
                        //_view3.frame = frame3;
                    }];
                } else if (v > 0) {
                    [UIView animateWithDuration:0.15 animations:^{
                        CGRect frame = self.tableView.frame;
                        frame.origin.x = 320;
                        self.tableView.frame = frame;
                        //CGRect frame3 = _view3.frame;
                        //frame3.origin.x = 768;
                        //_view3.frame = frame3;
                    }];
                } else if (v == 0) {
                    if (self.tableView.frame.origin.x <= 320/2) {
                        CGRect frame2 = self.tableView.frame;
                        frame2.origin.x = 0;
                        self.tableView.frame = frame2;
                        //CGRect frame3 = _view3.frame;
                        //frame3.origin.x = 448;
                        //_view3.frame = frame3;
                    } else {
                        CGRect frame = self.tableView.frame;
                        frame.origin.x = 320;
                        self.tableView.frame = frame;
                        //CGRect frame3 = _view3.frame;
                        //frame3.origin.x = 768;
                        //_view3.frame = frame3;
                    }
                }
            }
            
            break;
        }
            
        default:
            break;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint tr = [gestureRecognizer translationInView:self.tableView];
    return (fabsf(tr.x) > fabsf(tr.y));
}

@end