//
//  TCOrderTable.h
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCOrderCell.h"

@protocol TCOrderTableDelegate<NSObject>

-(void)TC_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end



@interface TCOrderTable : UITableView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)TCOrderCell *cell;
@property(nonatomic,assign)id <TCOrderTableDelegate>TC_delegate;
@end
