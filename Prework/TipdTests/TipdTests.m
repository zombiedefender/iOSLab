//
//  TipdTests.m
//  TipdTests
//
//  Created by Crt Tsai on 6/6/15.
//  Copyright (c) 2015 Crt Tsai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface TipdTests : XCTestCase

@property (strong, nonatomic) ViewController *vc;

@end

@implementation TipdTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateInitialViewController];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatVCInstantiates {
    // This is an example of a functional test case.
    //XCTAssert(YES, @"Pass");
    XCTAssertNotNil(self.vc);
}


- (void)testDisplayTotalAmountFor0{
    [self.vc displayTotalAmount:0];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
}

- (void)testDisplayTotalAmountFor123{
    [self.vc displayTotalAmount:123];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$123.00");
}
- (void)testDisplayTipAmountFor0{
    [self.vc displayTipAmount:0];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
}

- (void)testDisplayTipAmountFor45{
    [self.vc displayTipAmount:45];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$45.00");
}

-(void)testCaculateTipPercentForSegment0{
    float percent = [self.vc caculateTipPercentForSegment:0];
    XCTAssertEqualWithAccuracy(percent, 0.05, 0.001, @"Expected percent %f should be 0.05", percent);
}
-(void)testCaculateTipPercentForSegment3{
    float percent = [self.vc caculateTipPercentForSegment:3];
    XCTAssertEqualWithAccuracy(percent, 0.20, 0.001, @"Expected percent %f should be 0.20", percent);
}

-(void)testGetBillAmountWhenBlank{
    self.vc.billAmount.text = @"";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 0.0, 0.001);
}
-(void)testGetBillAmountFor12point34{
    self.vc.billAmount.text = @"12.34";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}
-(void)testCaculateTipAmount{
    float tip = [self.vc caculateTipAmount:12.34 percent:0.10];
    XCTAssertEqualWithAccuracy(tip, 1.23, 0.05);
}

-(void)testUpdateDisplayedTipForZero{
    self.vc.billAmount.text = @"0";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$0.00");
}

-(void)testUpdateDisplayedTipFor10by10{
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$1.00");
}

-(void)testUpdateDisplayedTotalForZero{
    self.vc.billAmount.text = @"0";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *tipString = self.vc.totalAmount.text;
    XCTAssertEqualObjects(tipString, @"$0.00");
}

-(void)testUpdateDisplayedTotalFor10by10{
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *tipString = self.vc.totalAmount.text;
    XCTAssertEqualObjects(tipString, @"$11.00");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
