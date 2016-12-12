//
//  ViewController.m
//  BZDThreadSantizerDemo
//
//  Created by Bruce on 16/12/12.
//  Copyright © 2016年 BruceZhu. All rights reserved.
//

#import "ViewController.h"
#import "BankDealBusiness.h"
@interface ViewController ()
@property (strong, nonatomic) BankDealBusiness *business;
@property (strong, nonatomic) dispatch_queue_t sameQueue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.business.balance = 200;
}

#pragma mark Click Handler
/*
 取钱
 */
- (IBAction)onClickWithdraw:(id)sender
{
    __weak typeof(self) weakself = self;
//    dispatch_async(self.sameQueue, ^{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakself.business withdrawMoney:100];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.lblTotalAmount.text = [NSString stringWithFormat:@"%ld", weakself.business.balance];
        });
    });
}

/*
 存钱
 */
- (IBAction)onClickDeposit:(id)sender
{
    __weak typeof(self) weakself = self;
//    dispatch_async(self.sameQueue, ^{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakself.business depositMoney:100];
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.lblTotalAmount.text = [NSString stringWithFormat:@"%ld", weakself.business.balance];
        });
    });
}

#pragma mark Getter And Setter
- (BankDealBusiness *)business
{
    if (_business == nil)
    {
        _business = [[BankDealBusiness alloc] init];
    }
    
    return _business;
}

- (dispatch_queue_t)sameQueue
{
    if (_sameQueue == nil)
    {
        _sameQueue = dispatch_queue_create("com.dangdang.ddreader", DISPATCH_QUEUE_SERIAL_INACTIVE);
    }
    
    return _sameQueue;
}

@end
