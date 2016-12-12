//
//  BankDealBusiness.m
//  BZDThreadSantizerDemo
//
//  Created by Bruce on 16/12/12.
//  Copyright © 2016年 BruceZhu. All rights reserved.
//

#import "BankDealBusiness.h"

@interface BankDealBusiness ()

@end

@implementation BankDealBusiness

/*
 取钱
 */
- (BOOL)withdrawMoney:(NSInteger)moneyAmount
{
    NSInteger newBalance = self.balance - moneyAmount;
    if (newBalance < 0)
    {
        return NO;
    }
    
    // 数钱，验证钱。
    sleep(2);
    
    self.balance = newBalance;
    
    return YES;
}

- (BOOL)depositMoney:(NSInteger)moneyAmount
{
    self.balance += moneyAmount;
    
    return YES;
}

@end
