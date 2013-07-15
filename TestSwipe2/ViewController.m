//
//  ViewController.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 10/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UITableView *view1;
@property (nonatomic, strong) UITableView *view2;
@property (nonatomic, strong) UITableView *view3;
@property (nonatomic, readwrite, strong) UIPanGestureRecognizer *panGR;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _view1 = [[UITableView alloc] initWithFrame:CGRectMake(  0, 0,  320, 1024)];
    _view2 = [[UITableView alloc] initWithFrame:CGRectMake(320, 0,  448, 1024)];
    _view3 = [[UITableView alloc] initWithFrame:CGRectMake(768, 0, 1024, 1024)];
    
    _view1.separatorStyle = UITableViewCellSeparatorStyleNone;
    _view1.showsVerticalScrollIndicator = NO;
    _view1.tableFooterView = [[[UIView alloc] init] autorelease];
    _view1.contentInset = UIEdgeInsetsMake(15.0,0.0,0,0.0);
    _view1.backgroundColor = [UIColor clearColor];
    
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
    
    _view1.dataSource = self;
    _view2.dataSource = self;
    _view3.dataSource = self;
    
    _view1.delegate = self;
    _view2.delegate = self;
    _view3.delegate = self;

    _panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    _panGR.maximumNumberOfTouches = 1;
    _panGR.delegate = self;
    [_view2 addGestureRecognizer:_panGR];
    
    [self.view addSubview:_view1];
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
    UIImageView *image, *separator;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ProductCellIdentifier];

        mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(135.0, 35.0, 170.0, 18.0)];
        mainLabel.tag = 1;
        mainLabel.font = [UIFont boldSystemFontOfSize:16];
        mainLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        mainLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:mainLabel];
        
        secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(135.0, 60.0, 170.0, 32.0)];
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
        separator.frame = CGRectMake(27, 129, 265.0, 2.0);
        [cell.contentView addSubview:separator];
        
        image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chapter.png"]];
        image.tag = 4;
        image.frame = CGRectMake(27, 12, 95, 105);
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
    cell.selectedBackgroundView = myBackView;
    [myBackView release];
    
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

            if (v < 0) {
                [UIView animateWithDuration:0.15 animations:^{
                    CGRect frame2 = _view2.frame;
                    frame2.origin.x = 0;
                    _view2.frame = frame2;
                    CGRect frame3 = _view3.frame;
                    frame3.origin.x = 448;
                    _view3.frame = frame3;
                }];
            } else {
                [UIView animateWithDuration:0.15 animations:^{
                    CGRect frame = _view2.frame;
                    frame.origin.x = 320;
                    _view2.frame = frame;
                    CGRect frame3 = _view3.frame;
                    frame3.origin.x = 768;
                    _view3.frame = frame3;
                }];
            }
            
            break;
        }
            
        default:
            break;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    /* get a static reference to the "hidden" UITableViewCellReorderControl class */
    static Class reorderControlClass = nil;
    if (reorderControlClass == nil) {
        reorderControlClass = NSClassFromString(@"UITableViewCellReorderControl");
    }
    
    if ([touch.view isKindOfClass:[UISlider class]] ||
        [touch.view isKindOfClass:reorderControlClass]) {
        // prevent recognizing touches on the slider / table view reorder control
        return NO;
    }
    return YES;
}


@end
