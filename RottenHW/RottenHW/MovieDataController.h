//
//  MovieDataController.h
//  RottenHW
//
//  Created by Crt Tsai on 6/15/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Movie;

@interface MovieDataController : NSObject

- (NSUInteger)movieCount;
- (Movie *)movieAtIndex:(NSUInteger)index;
- (void)addMovieWithTitle:(NSString *)title year:(NSString *)year synopsis:(NSString *)synopsis posters:(NSString *)posters
critics_score:(int)critics_score audience_score:(int)audience_score;


@end
