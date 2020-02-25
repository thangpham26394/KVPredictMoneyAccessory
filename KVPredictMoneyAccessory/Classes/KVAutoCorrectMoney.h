//
//  KVAutoCorrectMoney.h
//  KiotViet
//
//  Created by citigo on 6/21/17.
//  Copyright © 2017 Citigo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVAutoCorrectMoney : NSObject
+ (NSArray *)potentialMoneyWith:(double)money shouldDisplayDefault:(BOOL)shouldDisplayDefault;
@end
