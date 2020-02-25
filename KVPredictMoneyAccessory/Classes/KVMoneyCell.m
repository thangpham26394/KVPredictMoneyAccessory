//
//  KVMoneyCell.m
//  AcessoryViewCustom
//
//  Created by citigo on 6/17/17.
//  Copyright © 2017 citigo. All rights reserved.
//

#import "KVMoneyCell.h"

@implementation KVMoneyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = self.frame.size.height/2;
    self.layer.masksToBounds = YES;
    self.label.backgroundColor = [UIColor colorWithRed:0.294 green:0.631 blue:0.341 alpha:1.000];
}

@end
