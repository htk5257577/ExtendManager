//
//  NormalTableViewCell.m
//  ExtendTableViewCell
//
//  Created by 胡焘坤 on 2017/8/23.
//  Copyright © 2017年 胡焘坤. All rights reserved.
//

#import "NormalTableViewCell.h"

@interface NormalTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation NormalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)onButtonClicked:(id)sender {
    if (self.onButtonClicked) {
        self.onButtonClicked();
    }
}


- (void)configCell:(NSDictionary *)dataDic{
    self.titleLabel.text = dataDic[@"title"];
    self.onButtonClicked = ^(){
        NSLog(@"点击了title:%@ detail:%@",dataDic[@"title"],dataDic[@"detail"]);
    };
}
@end
