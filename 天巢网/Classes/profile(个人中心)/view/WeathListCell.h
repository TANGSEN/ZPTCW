//
//  WeathListCell.h
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeathListCell : UITableViewCell
/**支出 充值 收入*/
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;
/**余额*/
@property (strong, nonatomic) IBOutlet UILabel *RemindingLabel;
/**时间*/
@property (strong, nonatomic) IBOutlet UILabel *TimeLabel;
/**钱*/
@property (strong, nonatomic) IBOutlet UILabel *MoneyLabel;

@end
