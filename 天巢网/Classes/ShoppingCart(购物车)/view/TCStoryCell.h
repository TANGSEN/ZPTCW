//
//  TCStoryCell.h
//  天巢网
//
//  Created by tangjp on 15/11/20.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCStoryModel;

@interface TCStoryCell : UITableViewCell
@property (nonatomic ,strong) TCStoryModel *model;
/** 创建一个cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
