//
//  MovieDataController.m
//  RottenHW
//
//  Created by Crt Tsai on 6/15/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import "MovieDataController.h"
#import "Movie.h"

@interface MovieDataController()
@property (nonatomic, readonly) NSMutableArray *movieList;
-(void) initializeDefaultMovies;
@end

@implementation MovieDataController

-(id)init{
    self = [super init];
    if(self){
        _movieList = [[NSMutableArray alloc] init];
        [self initializeDefaultMovies];
        return self;
    }
    return nil;
}

-(void)initializeDefaultMovies{
    //call api here and get the response
    // api: http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=16&country=us&apikey=dagqdghwaq3e3mxyrp7kmmj5
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?limit=20&country=us&apikey=dagqdghwaq3e3mxyrp7kmmj5";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *movies = dict[@"movies"];
        NSString *title;
        NSString *year;
        NSString *synopsis;
        NSString *posters;
        int critics_score;
        int audience_score;
        
        //NSString *posterUrlString = [RottenTomatoesUtil hiResImageUrl:[movieData valueForKeyPath:@"posters.thumbnail"]];
        
        for (int i=0; i<20; i++) {
            NSDictionary *movieData = [dict objectForKey:@"movies"][i];
            
            title = [movieData objectForKey:@"title"];
            year = [movieData objectForKey:@"year"];
            synopsis = [movieData objectForKey:@"synopsis"];
            posters = [[movieData objectForKey:@"posters"] objectForKey: @"thumbnail"];
            //critics_score = [movieData objectForKey:@"ratings"][@"critics_score"];
            
            [self addMovieWithTitle:title year:year synopsis:synopsis posters:posters critics_score:12 audience_score:14];
            //[self addMovieWithTitle:movies[i][@"title"] year:movies[i][@"year"] synopsis:movies[i][@"synopsis"] posters:movies[i][@"synopsis"][@"thumbnail"] critics_score:[movies[i][@"ratings"][@"critics_score"] intValue] audience_score:[movies[i][@"ratings"][@"audience_score"] intValue]];
        }
        
        //NSDictionary *firstMovies = movies[0];
        //NSLog(@"%@", movies);
    }];
    
}
-(void)addMovieWithTitle:(NSString *)title year:(NSString *)year synopsis:(NSString *)synopsis posters:(NSString *)posters critics_score:(int)critics_score audience_score:(int)audience_score{
    Movie *newMovie = [[Movie alloc] initWithTitle:title year:year synopsis:synopsis posters:posters critics_score:critics_score audience_score:audience_score];
    [self.movieList addObject:newMovie];
}
-(NSUInteger)movieCount{
        NSLog(@"%@",self.movieList);
    return [self.movieList count];
}
-(Movie *)movieAtIndex:(NSUInteger)index{
    return [self.movieList objectAtIndex:index];
}
@end
