//
//  ViewController.m
//  Tipd
//
//  Created by Crt Tsai on 6/6/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self displayTheKeyboard];
    
}

- (void)onSettingsButton{
    //[self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)displayTheKeyboard {
    [self.billAmount becomeFirstResponder];
}

- (void)dismissTheKeyboard{
    [self.billAmount resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(UITapGestureRecognizer *)sender {
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self dismissTheKeyboard];
}

- (IBAction)tipPercentChanged:(UISegmentedControl *)sender {
    [self updateDisplayedTip];
    [self updateDisplayedTotal]; 
    [self dismissTheKeyboard];
    //NSLog(@"tip percent changed:%ld",(long)sender.selectedSegmentIndex);
}

- (NSString *)formatCurrency:(float)amount{
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithInt:amount];
    return [nf stringFromNumber:number];
}
- (void)displayTotalAmount:(float)amount{

    self.billAmount.text = [self formatCurrency:amount];
}
- (void)displayTipAmount:(float)amount{

    self.billAmount.text = [self formatCurrency:amount];
}
-(float)caculateTipPercentForSegment:(int)segment{
    NSString *tipText = [self.tipPercent titleForSegmentAtIndex:segment];
    return [tipText floatValue] / 100.0;
}
-(float)getBillAmount{
    return [self.billAmount.text floatValue];
}
-(float)caculateTipAmount:(float)amount percent:(float)percent{
    
    return amount * percent;
}
-(void)updateDisplayedTip{
    float amount = [self getBillAmount];
    int segment  = self.tipPercent.selectedSegmentIndex;
    float percent = [self caculateTipPercentForSegment:segment];
    float tip = [self caculateTipAmount:amount percent:percent];
    self.tipAmount.text= [self formatCurrency:tip];
}
-(void)updateDisplayedTotal{
    float amount = [self getBillAmount];
    int segment  = self.tipPercent.selectedSegmentIndex;
    float percent = [self caculateTipPercentForSegment:segment];
    float tip = [self caculateTipAmount:amount percent:percent];
    self.totalAmount.text= [self formatCurrency:tip+amount];
}
@end

