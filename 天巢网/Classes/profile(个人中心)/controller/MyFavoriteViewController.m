//
//  MyFavoriteViewController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//我的收藏

#import "MyFavoriteViewController.h"
#import "TCOrderCell.h"
@interface MyFavoriteViewController ()

@end

@implementation MyFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    TCOrderCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TCOrderCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.ImageView.image = [UIImage imageNamed:@"cm2_daily_banner3"];
    
    cell.PriceLabel.text = @"$9000";
    cell.PriceLabel.textColor = [UIColor orangeColor];
    cell.PriceLabel.font = AppFont(text_size_middle_1);
    
    cell.Count.text = [NSString stringWithFormat:@"数量：%d",10];
    cell.Count.textColor = Color_LightGray;
    cell.Count.font = AppFont(text_size_little_3);
    
    cell.ProductNameLabel.text = @"这是实木的床这是实木的床 你信不信你信不信";
    cell.ProductNameLabel.textColor = Color_LightGray;
    cell.ProductNameLabel.font = AppFont(text_size_little_1);
    
    
    
    [cell.BuyNowButton setTitle:@"取消收藏" forState:UIControlStateNormal];
    [cell.BuyNowButton setTitleColor:Color_LightGray forState:UIControlStateNormal];
    cell.BuyNowButton.titleLabel.font = AppFont(text_size_little_3);
    [cell.BuyNowButton addTarget:self action:@selector(CancelFavorite:) forControlEvents:UIControlEventTouchUpInside];
    cell.BuyNowButton.tag = indexPath.section*100+indexPath.row;
    
    [self getRounderCorner:cell.BuyNowButton];
    return cell;
    
    
}

-(UIView *)getRounderCorner:(UIView *)vView
{
    vView.layer.borderWidth  = 1.0f;
    vView.layer.borderColor = [Color_LightGray colorWithAlphaComponent:0.5].CGColor;
    vView.layer.cornerRadius = 4.0f;
    [vView.layer setMasksToBounds:YES];
    
    return nil;

}
-(void)CancelFavorite:(UIButton *)sender
{
    NSLog(@"取消收藏");
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100.0f;
}


@end
