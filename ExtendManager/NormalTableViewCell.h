//
//  NormalTableViewCell.h
//  ExtendTableViewCell
//
//  Created by 胡焘坤 on 2017/8/23.
//  Copyright © 2017年 胡焘坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalTableViewCell : UITableViewCell

@property (nonatomic , copy) void(^onButtonClicked)();

- (void)configCell:(NSDictionary *)dataDic;

@end
