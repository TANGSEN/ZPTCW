//
//  TCWealthListController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCWealthListController.h"
#import "WeathListCell.h"
@interface TCWealthListController ()

@property (nonatomic,strong)NSMutableArray *StatusArr;
@property (nonatomic,strong)NSMutableArray *RemindingArr;
@property (nonatomic,strong)NSMutableArray *TimeArr;

@end

@implementation TCWealthListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = View_BgColor;
    
    //**添加上拉刷新控件
   self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        });
    }];
    
}

-(NSMutableArray *)StatusArr
{
    if (!_StatusArr) {
        _StatusArr = [NSMutableArray arrayWithObjects:@"支出",@"收入",@"充值",@"支出",@"收入",@"充值",@"支出",@"收入",@"充值", nil];
    }
    return _StatusArr;
}

-(NSMutableArray *)TimeArr
{
    if (!_TimeArr) {
        _TimeArr = [NSMutableArray arrayWithObjects:@"2015-01-09",@"2015-05-19",@"2015-11-30",@"2015-01-09",@"2015-01-09",@"2015-05-19",@"2015-11-30",@"2015-01-09",@"2015-01-09", nil];
    }
    return _TimeArr;

}

-(NSMutableArray *)RemindingArr
{
    if (!_RemindingArr) {
        _RemindingArr = [NSMutableArray arrayWithObjects:@"800",@"1000",@"200",@"711",@"800",@"1000",@"200",@"711",@"345",nil];
    }
    return _RemindingArr;

}
#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.RemindingArr.count;

}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    WeathListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell= [[[NSBundle mainBundle]loadNibNamed:@"WeathListCell" owner:self options:nil] lastObject];
    }
        cell.StatusLabel.text = self.StatusArr[indexPath.row];
        cell.RemindingLabel.text = self.RemindingArr[indexPath.row];
        cell.TimeLabel.text = self.TimeArr[indexPath.row];
        cell.MoneyLabel.text = self.RemindingArr[indexPath.row];
        if ([cell.StatusLabel.text isEqualToString:@"支出"]) {
            cell.MoneyLabel.textColor = [UIColor redColor];
        }
         else if ([cell.StatusLabel.text isEqualToString:@"充值"]) {
            cell.MoneyLabel.textColor = [UIColor greenColor];
         }else{
            cell.MoneyLabel.textColor = [UIColor redColor];
         
         }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //去除底部分割线
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, 10)];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 65.0f;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
