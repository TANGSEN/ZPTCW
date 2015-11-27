//
//  TCShoppingTable.h
//  天巢网
//
//  Created by 赵贺 on 15/11/25.
//  Copyright © 2015年 tangjp. All rights reserved

//购物车 table

#import <UIKit/UIKit.h>



@interface TCShoppingTable : UITableView<UITableViewDataSource,UITableViewDelegate>
/**按钮数组*/
@property (nonatomic,strong)NSMutableArray *buttons;
@end
