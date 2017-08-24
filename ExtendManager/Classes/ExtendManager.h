//
//  ExtendManager.h
//  ExtendTableViewCell
//
//  Created by 胡焘坤 on 2017/8/24.
//  Copyright © 2017年 胡焘坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ExtendProtocol <NSObject>

/**
 @see tableView:numberOfRowsInSection:

 @param tableView 当前的tableView
 @param section 指定的section
 @return cell的个数
 */
-(NSInteger)normalTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;


/**
 @see tableView:cellForRowAtIndexPath

 @param tableView 当前的tableVie
 @param indexPath 指定的index
 @return 一般情况下的cell
 */
-(UITableViewCell *)normalTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


/**
 @see tableView:cellForRowAtIndexPath

 @param tableView 当前的tableVie
 @param indexPath 指定的index
 @return 展开的cell
 */
-(UITableViewCell *)expendTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional

/**
 @see tableView:heightForRowAtIndexPath:
        若不实现此方法,高度为默认值
 @param tableView 当前的tableVie
 @param indexPath 指定的index
 @return 一般情况下的cell的高度(默认48)
 */
-(CGFloat)normalTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

/**
 @see tableView:heightForRowAtIndexPath:
        若不实现此方法,高度为默认值
 @param tableView 当前的tableVie
 @param indexPath 指定的index
 @return 展开的cell的高度(默认48)
 */
-(CGFloat)expendTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;


/**
  若不实现此方法 默认section个数为1

 @param tableView 当前的tableVie
 @return section个数
 */
-(NSInteger)normalNumberOfSectionsInTableView:(UITableView *)tableView;
@end

@interface ExtendManager : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain)id <ExtendProtocol> delegate;

@end
