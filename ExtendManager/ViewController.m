//
//  ViewController.m
//  ExtendTableViewCell
//
//  Created by 胡焘坤 on 2017/8/23.
//  Copyright © 2017年 胡焘坤. All rights reserved.
//

#import "ViewController.h"
#import "NormalTableViewCell.h"
#import "ExtendedTableViewCell.h"
#import "ExtendManager.h"

static NSString* NormalCellIdentifier = @"NormalTableViewCell";

static NSString* ExpandedCellIdentifier = @"ExtendedTableViewCell";

@interface ViewController ()<ExtendProtocol>
@property (nonatomic, retain)NSArray *dataSource;
@property (nonatomic, retain)ExtendManager *extendManager;
@end

@implementation ViewController

-(ExtendManager *)extendManager{
    if (!_extendManager) {
        _extendManager = [[ExtendManager alloc] init];
    }
    return _extendManager;
}

-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = @[@{@"title" : @"标题1", @"detail" : @"标题1的详情"},@{@"title" : @"标题2", @"detail" : @"标题2的详情"},@{@"title" : @"标题3", @"detail" : @"标题3的详情"},@{@"title" : @"标题4", @"detail" : @"标题4的详情"},@{@"title" : @"标题5", @"detail" : @"标题5的详情"}];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate= self.extendManager;
    self.tableView.dataSource = self.extendManager;
    self.extendManager.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)normalTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalTableViewCell * normalCell = (NormalTableViewCell *)[tableView dequeueReusableCellWithIdentifier:NormalCellIdentifier];
    [normalCell configCell:self.dataSource[indexPath.row]];
    return normalCell;
}

-(UITableViewCell *)expendTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExtendedTableViewCell * extendedCell = (ExtendedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ExpandedCellIdentifier];
    [extendedCell configCell:self.dataSource[indexPath.row]];
    return extendedCell;
}

-(NSInteger)normalTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


@end
