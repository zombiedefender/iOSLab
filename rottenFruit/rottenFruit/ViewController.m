//
//  ViewController.m
//  rottenFruit
//
//  Created by Crt Tsai on 6/18/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import "ViewController.h"
#import <UIImageView+AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"synopsis"];
    NSString *posterURLString = [self.movie valueForKeyPath:@"posters.detailed"];
    posterURLString = [self hiResImageUrl:posterURLString];
    [self.postreView setImageWithURL:[NSURL URLWithString:posterURLString]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)hiResImageUrl: (NSString *) resizedImgUrl {
    if (resizedImgUrl == nil)
        return nil;
    NSArray *imgUrlToken = [resizedImgUrl componentsSeparatedByString:@"/"];
    NSLog(@"token: %@", imgUrlToken);
    
    NSInteger rangeLocation= 0;
    NSInteger rangeLength = [imgUrlToken count];
    for (NSInteger i=0; i< [imgUrlToken count]; i++) {
        NSRange match = [imgUrlToken[i] rangeOfString:@"cloudfront.net"];
        if (match.location != NSNotFound) {
            rangeLocation = i;
            rangeLength = rangeLength - i;
            break;
        }
    }
    imgUrlToken = [imgUrlToken subarrayWithRange: NSMakeRange(rangeLocation, rangeLength) ];
    imgUrlToken = [[NSArray arrayWithObject:@"http:/"] arrayByAddingObjectsFromArray:imgUrlToken];
    return [imgUrlToken componentsJoinedByString:@"/"];
}

@end
