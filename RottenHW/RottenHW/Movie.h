//
//  Movie.h
//  RottenHW
//
//  Created by Crt Tsai on 6/15/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *synopsis;
@property (nonatomic, copy) NSString *posters_thumbnail;
@property (nonatomic, copy) NSString *posters_large;

@property (nonatomic, assign) int critics_score;
@property (nonatomic, assign) int audience_score;

-(id)initWithTitle:(NSString *)title year:(NSString *)year synopsis:(NSString *)synopsis posters:(NSString *)posters
     critics_score:(int)critics_score audience_score:(int)audience_score;

@end
