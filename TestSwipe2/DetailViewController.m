//
//  DetailViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"
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
    
    self.tableView.frame = CGRectMake(320, 0, 448, 1024);
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.94 green:0.93 blue:0.93 alpha:1.0];
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ProductCellIdentifier = @"ProductCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProductCellIdentifier];
    }
    
    UIView *myBackView = [[UIView alloc] initWithFrame:cell.frame];
    myBackView.backgroundColor = [UIColor colorWithRed:0.0 green:0.64 blue:0.80 alpha:1];
    cell.selectedBackgroundView = myBackView;
    [myBackView release];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [NSString stringWithFormat:@"Empty Cell %d", indexPath.row];
}

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
    UIWebView* webView = ((RootViewController*) self.parentViewController).webView;
    UITableView* masterView = ((RootViewController*) self.parentViewController).masterViewController.tableView;
    
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
            webView.frame = CGRectOffset(webView.frame, trx, 0);
            [gestureRecognizer setTranslation:CGPointZero inView:self.tableView];
            
            if (self.tableView.frame.origin.x >= 0 && self.tableView.frame.origin.x <= 200) {
                masterView.alpha = self.tableView.frame.origin.x / 200.0;
            }
            
            break;
        }

        case UIGestureRecognizerStateEnded: {
            CGFloat v = [gestureRecognizer velocityInView:self.tableView].x;
            
            if (self.tableView.frame.origin.x >= 320) {
                [UIView animateWithDuration:0.15 animations:^{
                    CGRect frame = self.tableView.frame;
                    frame.origin.x = 320;
                    self.tableView.frame = frame;
                    CGRect frame3 = webView.frame;
                    frame3.origin.x = 768;
                    webView.frame = frame3;
                    masterView.alpha = 1.0;
                }];
            } else {
                if (v < 0) {
                    [UIView animateWithDuration:0.15 animations:^{
                        CGRect frame2 = self.tableView.frame;
                        frame2.origin.x = 0;
                        self.tableView.frame = frame2;
                        CGRect frame3 = webView.frame;
                        frame3.origin.x = 448;
                        webView.frame = frame3;
                        masterView.alpha = 0.0;
                    }];
                } else if (v > 0) {
                    [UIView animateWithDuration:0.15 animations:^{
                        CGRect frame = self.tableView.frame;
                        frame.origin.x = 320;
                        self.tableView.frame = frame;
                        CGRect frame3 = webView.frame;
                        frame3.origin.x = 768;
                        webView.frame = frame3;
                        masterView.alpha = 1.0;
                    }];
                } else if (v == 0) {
                    if (self.tableView.frame.origin.x <= 320/2) {
                        CGRect frame2 = self.tableView.frame;
                        frame2.origin.x = 0;
                        self.tableView.frame = frame2;
                        CGRect frame3 = webView.frame;
                        frame3.origin.x = 448;
                        webView.frame = frame3;
                        masterView.alpha = 0.0;
                    } else {
                        CGRect frame = self.tableView.frame;
                        frame.origin.x = 320;
                        self.tableView.frame = frame;
                        CGRect frame3 = webView.frame;
                        frame3.origin.x = 768;
                        webView.frame = frame3;
                        masterView.alpha = 1.0;
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
