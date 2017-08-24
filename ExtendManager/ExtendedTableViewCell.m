//
//  ExtendedTableViewCell.m
//  ExtendTableViewCell
//
//  Created by 胡焘坤 on 2017/8/23.
//  Copyright © 2017年 胡焘坤. All rights reserved.
//

#import "ExtendedTableViewCell.h"

@interface ExtendedTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation ExtendedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configCell:(NSDictionary *)dataDic{
    self.detailLabel.text = dataDic[@"detail"];
}

@end
