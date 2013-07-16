//
//  ViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 10/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "RootViewController.h"
#import "MasterViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) MasterViewController *masterViewController;
@property (nonatomic, strong) UITableView *view2;
@property (nonatomic, strong) UITableView *view3;
@property (nonatomic, readwrite, strong) UIPanGestureRecognizer *panGR;
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _view2 = [[UITableView alloc] initWithFrame:CGRectMake(320, 0,  448, 1024)];
    _view3 = [[UITableView alloc] initWithFrame:CGRectMake(768, 0, 1024, 1024)];
    
    _view2.layer.masksToBounds = NO;
    _view2.layer.shadowOffset = CGSizeMake(0, 0);
    _view2.layer.shadowRadius = 10;
    _view2.layer.shadowOpacity = 0.5;
    _view2.layer.shouldRasterize = YES;
    _view2.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _view2.layer.shadowPath = [UIBezierPath bezierPathWithRect:_view2.bounds].CGPath;
    
    _view3.layer.masksToBounds = NO;
    _view3.layer.shadowOffset = CGSizeMake(0, 0);
    _view3.layer.shadowRadius = 10;
    _view3.layer.shadowOpacity = 0.5;
    _view3.layer.shouldRasterize = YES;
    _view3.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _view3.layer.shadowPath = [UIBezierPath bezierPathWithRect:_view2.bounds].CGPath;
    
    _view2.dataSource = self;
    _view3.dataSource = self;
    
    _view2.delegate = self;
    _view3.delegate = self;

    _panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    _panGR.maximumNumberOfTouches = 1;
    _panGR.delegate = self;
    [_view2 addGestureRecognizer:_panGR];
    
    self.masterViewController = [[MasterViewController alloc] init];
    [self addChildViewController:self.masterViewController];
    [self.view addSubview:self.masterViewController.tableView];
    [self.masterViewController didMoveToParentViewController:self];

    [self.view addSubview:_view2];
    [self.view addSubview:_view3];

    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundnoise.png"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
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

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
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
            CGFloat trx = [gestureRecognizer translationInView:_view2].x;

            _view2.frame = CGRectOffset(_view2.frame, trx, 0);
            _view3.frame = CGRectOffset(_view3.frame, trx, 0);
            [gestureRecognizer setTranslation:CGPointZero inView:_view2];
            
            break;
        }
            
        case UIGestureRecognizerStateEnded: {
            CGFloat v = [gestureRecognizer velocityInView:_view2].x;

            if (_view2.frame.origin.x >= 320) {
                [UIView animateWithDuration:0.15 animations:^{
                    CGRect frame = _view2.frame;
                    frame.origin.x = 320;
                    _view2.frame = frame;
                    CGRect frame3 = _view3.frame;
                    frame3.origin.x = 768;
                    _view3.frame = frame3;
                }];
            } else {
                if (v < 0) {
                    [UIView animateWithDuration:0.15 animations:^{
                        CGRect frame2 = _view2.frame;
                        frame2.origin.x = 0;
                        _view2.frame = frame2;
                        CGRect frame3 = _view3.frame;
                        frame3.origin.x = 448;
                        _view3.frame = frame3;
                    }];
                } else if (v > 0) {
                    [UIView animateWithDuration:0.15 animations:^{
                        CGRect frame = _view2.frame;
                        frame.origin.x = 320;
                        _view2.frame = frame;
                        CGRect frame3 = _view3.frame;
                        frame3.origin.x = 768;
                        _view3.frame = frame3;
                    }];
                } else if (v == 0) {
                    if (_view2.frame.origin.x <= 320/2) {
                        CGRect frame2 = _view2.frame;
                        frame2.origin.x = 0;
                        _view2.frame = frame2;
                        CGRect frame3 = _view3.frame;
                        frame3.origin.x = 448;
                        _view3.frame = frame3;
                    } else {
                        CGRect frame = _view2.frame;
                        frame.origin.x = 320;
                        _view2.frame = frame;
                        CGRect frame3 = _view3.frame;
                        frame3.origin.x = 768;
                        _view3.frame = frame3;
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
    CGPoint tr = [gestureRecognizer translationInView:_view2];
    return (fabsf(tr.x) > fabsf(tr.y));
}

@end
