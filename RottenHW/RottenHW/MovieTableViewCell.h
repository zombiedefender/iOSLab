//
//  MovieTableViewCell.h
//  RottenHW
//
//  Created by Crt Tsai on 6/15/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsisLabel;

@end
