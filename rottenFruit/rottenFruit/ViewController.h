//
//  ViewController.h
//  rottenFruit
//
//  Created by Crt Tsai on 6/18/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *postreView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@property (strong,nonatomic) NSDictionary *movie;
@end

