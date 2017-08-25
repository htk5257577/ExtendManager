//
//  ExtendManager.m
//  ExtendTableViewCell
//
//  Created by 胡焘坤 on 2017/8/24.
//  Copyright © 2017年 胡焘坤. All rights reserved.
//

#import "ExtendManager.h"

@interface ExtendManager ()
@property (nonatomic, retain)NSIndexPath *extendIndexPath;
@end

@implementation ExtendManager

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.extendIndexPath && self.extendIndexPath.section == indexPath.section) {
        if (indexPath.row < self.extendIndexPath.row) {
            if ([self.delegate respondsToSelector:@selector(normalTableView:cellForRowAtIndexPath:)]) {
                return [self.delegate normalTableView:tableView cellForRowAtIndexPath:indexPath];
            }
        }else if (indexPath.row  == self.extendIndexPath.row){
            if ([self.delegate respondsToSelector:@selector(expendTableView:cellForRowAtIndexPath:)]) {
                return [self.delegate expendTableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
            }
        }else{
            if ([self.delegate respondsToSelector:@selector(normalTableView:cellForRowAtIndexPath:)]) {
                return [self.delegate normalTableView:tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
            }
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(normalTableView:cellForRowAtIndexPath:)]) {
            return [self.delegate normalTableView:tableView cellForRowAtIndexPath:indexPath];
        }
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView beginUpdates];
    if (self.extendIndexPath) {
        [tableView deleteRowsAtIndexPaths:@[self.extendIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        if (self.extendIndexPath.section == indexPath.section && (self.extendIndexPath.row - 1 == indexPath.row || self.extendIndexPath.row == indexPath.row)) {
            self.extendIndexPath = nil;
        }else if (self.extendIndexPath.section == indexPath.section && self.extendIndexPath.row < indexPath.row){
            self.extendIndexPath = indexPath;
            [tableView insertRowsAtIndexPaths:@[self.extendIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }else{
            self.extendIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1  inSection:indexPath.section];
            [tableView insertRowsAtIndexPaths:@[self.extendIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }else{
        self.extendIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1  inSection:indexPath.section];
        [tableView insertRowsAtIndexPaths:@[self.extendIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    [tableView endUpdates];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.extendIndexPath && self.extendIndexPath == indexPath) {
        if ([self.delegate respondsToSelector:@selector(expendTableView:heightForRowAtIndexPath:)]) {
            return [self.delegate expendTableView:tableView heightForRowAtIndexPath:indexPath];
        }else{
            return 48;
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(normalTableView:heightForRowAtIndexPath:)]) {
            return [self.delegate normalTableView:tableView heightForRowAtIndexPath:indexPath];
        }else{
            return 48;
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.extendIndexPath && self.extendIndexPath.section == section) {
        if ([self.delegate respondsToSelector:@selector(normalTableView:numberOfRowsInSection:)]) {
            return [self.delegate normalTableView:tableView numberOfRowsInSection:section] + 1;
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(normalTableView:numberOfRowsInSection:)]) {
            return [self.delegate normalTableView:tableView numberOfRowsInSection:section];
        }
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self.delegate respondsToSelector:@selector(normalNumberOfSectionsInTableView:)]) {
        return [self.delegate normalNumberOfSectionsInTableView:tableView];
    }else{
        return 1;
    }
}

@end
