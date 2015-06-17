//
//  ViewController.m
//  Test
//
//  Created by Crt Tsai on 6/10/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayTime;
@property NSTimer *trigger;
- (IBAction)buttonPushed:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self runTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)runTime{
    self.trigger = [NSTimer scheduledTimerWithTimeInterval: 0.5
                    target: self
                    selector: @selector(updateLabel)
                    userInfo: nil
                    repeats: YES];
}

- (void)updateLabel{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [formatter setAMSymbol:@"am"];
    [formatter setPMSymbol:@"pm"];
    [self.displayTime setText:[formatter stringFromDate:date]];
}


- (IBAction)buttonPushed:(UIButton *)sender {
}
@end
