//
//  ViewController.h
//  Tipd
//
//  Created by Crt Tsai on 6/6/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;
@property (weak, nonatomic) IBOutlet UITextField *tipAmount;
@property (weak, nonatomic) IBOutlet UITextField *totalAmount;
- (IBAction)OnTap:(UITapGestureRecognizer *)sender;
- (IBAction)tipPercentChanged:(UISegmentedControl *)sender;

-(void)displayTotalAmount:(float)amount;
-(void)displayTipAmount:(float)amount;
-(float)caculateTipPercentForSegment:(int)segment;
-(float)getBillAmount;
-(float)caculateTipAmount:(float)amount percent:(float)percent;
-(void)updateDisplayedTip;
-(void)updateDisplayedTotal;
@end

