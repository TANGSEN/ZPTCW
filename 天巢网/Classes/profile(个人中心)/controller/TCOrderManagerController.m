//
//  TCOrderManagerController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCOrderManagerController.h"
#import "TCDetailOrderController.h"
#import "TCWealthListController.h"
@interface TCOrderManagerController ()
@property (nonatomic,strong)CustomerView *topView;
@property (nonatomic,strong)TCOrderTable *tableView1;
@property (nonatomic,strong)TCOrderTable *tableView2;
@end

@implementation TCOrderManagerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部订单";
    self.topView = [[CustomerView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, 47) initButWithArray:[NSArray arrayWithObjects:@"未付款",@"已完成",nil]butFont:(NSInteger)16];
    [self.view addSubview:self.topView];
    self.view.frame = CGRectMake(0,64, ApplicationframeValue.width, ApplicationframeValue.height-64);
    self.topView.delegate = self;
    self.topView.clipsToBounds = YES;
    self.view.backgroundColor = View_BgColor;
    self.tableView1.showsHorizontalScrollIndicator = NO;
    self.tableView1.showsVerticalScrollIndicator = NO;
    
    self.tableView2.showsHorizontalScrollIndicator = NO;
    self.tableView2.showsVerticalScrollIndicator = NO;
    self.tableView1 = [[TCOrderTable alloc] initWithFrame:CGRectMake(0, 47, ApplicationframeValue.width, ApplicationframeValue.height-47-64)];
    [self.tableView1.cell.BuyNowButton setTitle:@"立即购买" forState:UIControlStateNormal];
    self.tableView1.TC_delegate = self;
    
    self.tableView2 = [[TCOrderTable alloc] initWithFrame:CGRectMake(0, 47, ApplicationframeValue.width, ApplicationframeValue.height-47-64)];
    [self.tableView2.cell.BuyNowButton setTitle:@"立即评价" forState:UIControlStateNormal];

    self.tableView1.backgroundColor = View_BgColor;
    self.tableView2.TC_delegate = self;

    self.tableView2.backgroundColor = View_BgColor;
    [self.view addSubview:self.tableView1];
   
    
}

-(void)OnclickCustomerTag:(NSInteger)customerTag
{
    if (customerTag == self.topView.currentIndex) {
        return;
    }
    
    NSLog(@"%ld",(long)customerTag);
    
    switch (customerTag) {
        case 1:
            [self.tableView2 removeFromSuperview];
            [self.tableView1.cell.BuyNowButton setTitle:@"立即购买" forState:UIControlStateNormal];
            [self.view addSubview:self.tableView1];
            [self.view bringSubviewToFront:self.tableView1];
            
            [self.tableView1 reloadData];
            break;
        case 2:
            [self.tableView1 removeFromSuperview];
            [self.view addSubview:self.tableView2];
            [self.tableView2.cell.BuyNowButton setTitle:@"立即评价" forState:UIControlStateNormal];
            [self.view bringSubviewToFront:self.tableView2];
            
            [self.tableView2 reloadData];
        default:
            break;
    }
   
}


-(void)TC_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TCDetailOrderController *detail = [[TCDetailOrderController alloc] initWithNibName:@"TCDetailOrderController" bundle:nil];
    [self.navigationController pushViewController:detail animated:YES];

}


@end
