//
//  Movie.m
//  RottenHW
//
//  Created by Crt Tsai on 6/15/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import "Movie.h"

@implementation Movie
-(id)initWithTitle:(NSString *)title year:(NSString *)year synopsis:(NSString *)synopsis posters:(NSString *)posters
     critics_score:(int)critics_score audience_score:(int)audience_score{
    self = [super init];
    if(self){
        _title = title;
        _year = year;
        _synopsis = synopsis;
        _posters_thumbnail = posters;
        //handle large img here
        _critics_score = critics_score;
        _audience_score = audience_score;
        
        return self;
    }
    return nil;
}
@end
