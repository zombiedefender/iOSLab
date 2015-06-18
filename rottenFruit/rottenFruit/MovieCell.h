//
//  MovieCell.h
//  rottenFruit
//
//  Created by Crt Tsai on 6/18/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end
