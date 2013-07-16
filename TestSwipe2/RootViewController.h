//
//  ViewController.h
//  TestSwipe2
//
//  Created by Jean-André Santoni on 10/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MasterViewController.h"
#import "DetailViewController.h"

@interface RootViewController : UIViewController
@property (nonatomic, strong) MasterViewController *masterViewController;
@property (nonatomic, strong) DetailViewController *detailViewController;
@property (nonatomic, strong) UIWebView *webView;
@end
