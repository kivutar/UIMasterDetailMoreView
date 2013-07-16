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
        primaryLabel.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        primaryLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:primaryLabel];
        
        secondaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.0, 60.0, 170.0, 32.0)];
        secondaryLabel.font = [UIFont systemFontOfSize:14];
        secondaryLabel.textColor = [UIColor colorWithRed:0.55 green:0.55 blue:0.55 alpha:1.0];
        secondaryLabel.backgroundColor = [UIColor clearColor];
        secondaryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        secondaryLabel.numberOfLines = 0;
        [self.contentView addSubview:secondaryLabel];
        
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chapter.png"]];
        imageView.frame = CGRectMake(12, 12, 95, 105);
        imageView.layer.masksToBounds = NO;
        imageView.layer.shadowOffset = CGSizeMake(0, 0);
        imageView.layer.shadowRadius = 5;
        imageView.layer.shadowOpacity = 0.5;
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

    // Configure the view for the selected state
}

@end
