//
//  MasterViewController.m
//  RottenHW
//
//  Created by Crt Tsai on 6/15/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MovieDataController.h"
#import "Movie.h"
#import "MovieTableViewCell.h"

@interface MasterViewController ()

//@property NSMutableArray *objects;
@property (nonatomic,strong) MovieDataController *movieDataController;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    self.movieDataController = [[MovieDataController alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Movie *movie = [self.movieDataController movieAtIndex:indexPath.row];
        //NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:movie];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movieDataController movieCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];

    Movie *movie = [self.movieDataController movieAtIndex:indexPath.row];
    //cell.movieImage.??? = movie.posters_thumbnail;
    cell.movieTitleLabel.text = movie.title;
    cell.movieSynopsisLabel.text = movie.synopsis;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
