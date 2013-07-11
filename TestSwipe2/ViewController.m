//
//  ViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 10/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *view1;
@property (nonatomic, strong) UITableView *view2;
@property (nonatomic, strong) UITableView *view3;
@end

@implementation ViewController

CGRect state0view1;
CGRect state1view1;
CGRect state2view1;

CGRect state0view2;
CGRect state1view2;
CGRect state2view2;

CGRect state0view3;
CGRect state1view3;
CGRect state2view3;

int state;

- (void)viewDidLoad
{
    [super viewDidLoad];

    state0view1 = CGRectMake(  0, 0,  320, 1024);
    state1view1 = CGRectMake(  0, 0,  320, 1024);
    state2view1 = CGRectMake(  0, 0,  320, 1024);

    state0view2 = CGRectMake(320, 0,  448, 1024);
    state1view2 = CGRectMake(  0, 0,  448, 1024);
    state2view2 = CGRectMake(  0, 0,  448, 1024);

    state0view3 = CGRectMake(768, 0, 1024, 1024);
    state1view3 = CGRectMake(448, 0, 1024, 1024);
    state2view3 = CGRectMake(  0, 0, 1024, 1024);
    
    _view1 = [[UITableView alloc] initWithFrame:state0view1];
    _view2 = [[UITableView alloc] initWithFrame:state0view2];
    _view3 = [[UITableView alloc] initWithFrame:state0view3];
    
    _view1.separatorStyle = UITableViewCellSeparatorStyleNone;
    _view1.showsVerticalScrollIndicator = NO;
    _view1.tableFooterView = [[[UIView alloc] init] autorelease];
    
    _view2.layer.masksToBounds = NO;
    _view2.layer.shadowRadius = 5;
    _view2.layer.shadowOpacity = 0.5;
    _view2.layer.shouldRasterize = YES;
    _view2.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _view2.layer.shadowPath = [UIBezierPath bezierPathWithRect:_view2.bounds].CGPath;
    
    _view3.layer.masksToBounds = NO;
    _view3.layer.shadowRadius = 5;
    _view3.layer.shadowOpacity = 0.5;
    _view3.layer.shouldRasterize = YES;
    _view3.layer.rasterizationScale = [UIScreen mainScreen].scale;
    _view3.layer.shadowPath = [UIBezierPath bezierPathWithRect:_view2.bounds].CGPath;
    
    _view1.dataSource = self;
    _view2.dataSource = self;
    _view3.dataSource = self;
    
    _view1.delegate = self;
    _view2.delegate = self;
    _view3.delegate = self;
    
    /*_view1.bounces = false;
    _view2.bounces = false;
    _view3.bounces = false;*/
    
    _view1.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"backgroundnoise.png"]];

    state = 0;

    UISwipeGestureRecognizer *view2swipeleft = [[[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(view2swipeleft:)] autorelease];
    [view2swipeleft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_view2 addGestureRecognizer:view2swipeleft];

    UISwipeGestureRecognizer *view2swiperight = [[[UISwipeGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(view2swiperight:)] autorelease];
    [view2swiperight setDirection:UISwipeGestureRecognizerDirectionRight];
    [_view2 addGestureRecognizer:view2swiperight];

    UISwipeGestureRecognizer *view3swipeleft = [[[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(view3swipeleft:)] autorelease];
    [view3swipeleft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [_view3 addGestureRecognizer:view3swipeleft];

    UISwipeGestureRecognizer *view3swiperight = [[[UISwipeGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(view3swiperight:)] autorelease];
    [view3swiperight setDirection:UISwipeGestureRecognizerDirectionRight];
    [_view3 addGestureRecognizer:view3swiperight];
    
    [self.view addSubview:_view1];
    [self.view addSubview:_view2];
    [self.view addSubview:_view3];
}

- (void)view2swipeleft:(UITapGestureRecognizer *)recognizer {
    if (state == 0) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state1view2;
            _view3.frame = state1view3;
            state = 1;
        }];
    } else if (state == 1) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state2view2;
            _view3.frame = state2view3;
            state = 2;
        }];
    }
}

- (void)view2swiperight:(UITapGestureRecognizer *)recognizer {
    if (state == 1) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state0view2;
            _view3.frame = state0view3;
            state = 0;
        }];
    }
}

- (void)view3swipeleft:(UITapGestureRecognizer *)recognizer {
    if (state == 0) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state2view2;
            _view3.frame = state2view3;
            state = 2;
        }];
    } else if (state == 1) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state2view2;
            _view3.frame = state2view3;
            state = 2;
        }];
    }
}

- (void)view3swiperight:(UITapGestureRecognizer *)recognizer {
    if (state == 1) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state0view2;
            _view3.frame = state0view3;
            state = 0;
        }];
    } else if (state == 2) {
        [UIView animateWithDuration:0.25 animations:^{
            _view2.frame = state1view2;
            _view3.frame = state1view3;
            state = 1;
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ProductCellIdentifier = @"ProductCellIdentifier";
    
    UILabel *mainLabel, *secondLabel;
    UIImageView *photo, *separator;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProductCellIdentifier];

        mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 40.0, 200.0, 18.0)];
        mainLabel.tag = 1;
        mainLabel.font = [UIFont boldSystemFontOfSize:18];
        mainLabel.textColor = [UIColor whiteColor];
        mainLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:mainLabel];
        
        secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(100.0, 65.0, 200.0, 32.0)];
        secondLabel.tag = 2;
        secondLabel.font = [UIFont systemFontOfSize:16.0];
        secondLabel.textColor = [UIColor grayColor];
        secondLabel.backgroundColor = [UIColor clearColor];
        secondLabel.lineBreakMode = NSLineBreakByWordWrapping;
        secondLabel.numberOfLines = 0;
        
        CGRect currentFrame = secondLabel.frame;
        CGSize max = CGSizeMake(secondLabel.frame.size.width, 200);
        CGSize expected = [@"Lorem ipsum et dolor sit amet" sizeWithFont:secondLabel.font constrainedToSize:max lineBreakMode:secondLabel.lineBreakMode];
        currentFrame.size.height = expected.height;
        secondLabel.frame = currentFrame;
        
        [cell.contentView addSubview:secondLabel];
        
        separator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"separator.png"]];
        separator.tag = 3;
        separator.frame = CGRectMake(27, 129, 265.0, 2.0);
        [cell.contentView addSubview:separator];
        
    } else {
        mainLabel = (UILabel *)[cell.contentView viewWithTag:1];
        secondLabel = (UILabel *)[cell.contentView viewWithTag:2];
        separator = (UIImageView *)[cell.contentView viewWithTag:3];
    }
    
    mainLabel.text = @"Chapter 3";
    secondLabel.text = @"Lorem ipsum et dolor sit amet";
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    //cell.textLabel.text = [NSString stringWithFormat:@"Empty Cell %d", indexPath.row];
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
