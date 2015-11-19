//
//  TCOrderTable.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCOrderTable.h"
#import "TCOrderCell.h"

#import "EvaluationView.h"
@implementation TCOrderTable



-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    self.delegate = self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator = YES;
  
    
    return self;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1)
    {
    
        return 2;
    }
    else{
        return 1;
    }
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
    
    

    [cell.BuyNowButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [cell.BuyNowButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    cell.BuyNowButton.titleLabel.font = AppFont(text_size_little_2);
    [cell.BuyNowButton addTarget:self action:@selector(BuyNow:) forControlEvents:UIControlEventTouchUpInside];
    cell.BuyNowButton.tag = indexPath.section*100+indexPath.row;
    self.cell = cell;
    [self getRounderCorner:cell.BuyNowButton];
    return cell;


}
/**点击事件*/
-(void)BuyNow:(UIButton *)button
{

    
    EvaluationView *view = [[EvaluationView alloc] initWithFrame:CGRectMake(10,80, ApplicationframeValue.width-20, ApplicationframeValue.height-150)];
    
    [view show];


}
/**圆角按钮*/
-(UIView *)getRounderCorner:(UIView *)vView
{
    vView.layer.borderWidth  = 1.4f;
    vView.layer.borderColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
    vView.layer.cornerRadius = 6.0f;
    [vView.layer setMasksToBounds:YES];
    
    return nil;



}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.TC_delegate respondsToSelector:@selector(TC_tableView:didSelectRowAtIndexPath:)]) {
        [self.TC_delegate TC_tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    
    
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
