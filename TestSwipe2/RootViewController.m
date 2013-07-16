//
//  RootViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 10/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize masterViewController, detailViewController, webView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.masterViewController = [[MasterViewController alloc] init];
    [self addChildViewController:self.masterViewController];
    [self.view addSubview:self.masterViewController.tableView];
    [self.masterViewController didMoveToParentViewController:self];

    self.detailViewController = [[DetailViewController alloc] init];
    [self addChildViewController:self.detailViewController];
    [self.view addSubview:self.detailViewController.tableView];
    [self.detailViewController didMoveToParentViewController:self];

    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(768, 0, 1024, 1024)];
    self.webView.backgroundColor = [UIColor clearColor];

    for (UIView *view in [self.webView subviews]) {
        view.clipsToBounds = NO;
        view.layer.masksToBounds = NO;
    }
    
    for (UIView *view in [[[self.webView subviews] objectAtIndex:0] subviews]) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.hidden = YES;
        } else {
            view.clipsToBounds = NO;
            view.layer.masksToBounds = NO;
            view.layer.shadowOffset = CGSizeMake(0, 0);
            view.layer.shadowRadius = 10;
            view.layer.shadowOpacity = 0.5;
            view.layer.shouldRasterize = YES;
            view.layer.rasterizationScale = [UIScreen mainScreen].scale;
            view.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.webView.bounds].CGPath;
        }
    }
    [self.view addSubview:self.webView];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundnoise.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
