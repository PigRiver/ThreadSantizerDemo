//
//  BankDealBusiness.h
//  BZDThreadSantizerDemo
//
//  Created by Bruce on 16/12/12.
//  Copyright © 2016年 BruceZhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BankDealBusiness : NSObject
@property (assign, nonatomic) NSInteger balance;
/*
 取钱
 */
- (BOOL)withdrawMoney:(NSInteger)moneyAmount;
/*
 存钱
 */
- (BOOL)depositMoney:(NSInteger)moneyAmount;
@end
