//
//  UIMasterViewCell.m
//  TestSwipe2
//
//  Created by Jean-André Santoni on 16/07/13.
//  Copyright (c) 2013 Jean-André Santoni. All rights reserved.
//

#import "UIMasterViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIMasterViewCell

@synthesize primaryLabel, secondaryLabel, imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        primaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 35.0, 170.0, 18.0)];
        primaryLabel.font = [UIFont boldSystemFontOfSize:16];
        primaryLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:primaryLabel];
        
        secondaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 60.0, 170.0, 32.0)];
        secondaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel.backgroundColor = [UIColor clearColor];
        secondaryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        secondaryLabel.numberOfLines = 0;
        [self.contentView addSubview:secondaryLabel];
        
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chapter.png"]];
        imageView.frame = CGRectMake(12, 12, 95, 105);
        imageView.layer.masksToBounds = NO;
        imageView.layer.shadowOffset = CGSizeMake(0, 1);
        imageView.layer.shadowRadius = 3;
        imageView.layer.shadowOpacity = 0.35;
        imageView.layer.shouldRasterize = YES;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shadowPath = [UIBezierPath bezierPathWithRect:imageView.bounds].CGPath;
        [self.contentView addSubview:imageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    if (selected) {
        self.primaryLabel.textColor = [UIColor whiteColor];
        self.primaryLabel.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];
        self.primaryLabel.shadowOffset = CGSizeMake(0.0, -1.0);
        self.secondaryLabel.textColor = [UIColor colorWithRed:0.75 green:0.90 blue:0.93 alpha:1.0];
        self.secondaryLabel.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];
        self.secondaryLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    } else {
        self.primaryLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        self.primaryLabel.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];
        self.primaryLabel.shadowOffset = CGSizeMake(0.0, 1.0);
        self.secondaryLabel.textColor = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1.0];
        self.secondaryLabel.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.25];
        self.secondaryLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    }
}

@end
