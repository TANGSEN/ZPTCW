//
//  MyFavoriteViewController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//我的收藏

#import "MyFavoriteViewController.h"
#import "TCOrderCell.h"
#import "ShoppingModel.h"
@interface MyFavoriteViewController ()
@property (nonatomic,strong)ShoppingModel *shopModel;
@property (nonatomic,strong)NSMutableArray *arr;
@end


@implementation MyFavoriteViewController
-(NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [ShoppingModel demoData];
    }
    return _arr;

}
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
    return self.arr.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ShoppingModel *model = self.arr[indexPath.section];
    static NSString *ID = @"cell";
    TCOrderCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TCOrderCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.ImageView.image = [UIImage imageNamed:@"placehyolder"];
    
    cell.PriceLabel.text = model.Price;
    cell.PriceLabel.adjustsFontSizeToFitWidth = YES;
    cell.PriceLabel.textColor = [UIColor orangeColor];
    cell.PriceLabel.font = AppFont(text_size_middle_1);
    
    cell.Count.text = [NSString stringWithFormat:@"数量：%@",model.Count];
    cell.Count.textColor = Color_LightGray;
    cell.Count.font = AppFont(text_size_little_3);
    
    cell.ProductNameLabel.text = model.ProductName;
    cell.ProductNameLabel.textColor = Color_LightGray;
    cell.ProductNameLabel.font = AppFont(text_size_little_1);
    
    
    
    [cell.BuyNowButton setTitle:@"取消收藏" forState:UIControlStateNormal];
    [cell.BuyNowButton setTitleColor:Color_LightGray forState:UIControlStateNormal];
    cell.BuyNowButton.titleLabel.font = AppFont(text_size_little_3);
    /**取消收藏*/
    [cell.BuyNowButton bk_addEventHandler:^(id sender) {
    
        [self.arr removeObjectAtIndex:indexPath.section];
        [self.tableView reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100.0f;
}


@end
