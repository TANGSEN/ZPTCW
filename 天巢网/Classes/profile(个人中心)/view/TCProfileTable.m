//
//  TCProfileTable.m
//  个人中心
//
//  Created by 赵贺 on 15/12/15.
//  Copyright © 2015年 赵贺. All rights reserved.
//

#import "TCProfileTable.h"
#import "Channel.h"
#import "ChannelView.h"
#import "ImageTitleButton.h"
#import "TreasureView.h"
@interface TCProfileTable ()
/**分区图*/
@property (nonatomic,strong)NSArray *ImageArr;
/**分区title*/
@property (nonatomic,strong)NSArray *TitleArr;
/**订单图标*/
@property (nonatomic,strong)NSArray *OrderImages;
/**订单title*/
@property (nonatomic,strong)NSArray *OrderTitles;

/**资产图标*/
@property (nonatomic,strong)NSArray *TreasureDetail;
/**资产title*/
@property (nonatomic,strong)NSArray *TreasureTitles;

@property (nonatomic,strong)UILabel *TopLabel;
@property (nonatomic,strong)UILabel *BottomLabel;
@end

@implementation TCProfileTable


-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;

}

-(NSArray *)ImageArr
{

    if (!_ImageArr) {
        _ImageArr = @[@"per_icon_indent",@"per_icon_treasu",@"profile_icon_shoucang",@"profile_icon_yijianfankui"];
    }
    return _ImageArr;
}

-(NSArray *)TitleArr
{

    if (!_TitleArr) {
        _TitleArr = @[@"我的订单",@"我的资产",@"我的收藏",@"意见反馈"];
    }
    return _TitleArr;
}



-(NSArray *)OrderImages
{
    
    if (!_OrderImages) {
        _OrderImages = @[@"per_icon_daifukuan",@"per_icon_daishouhuo",@"per_icon_daipingjia",@"per_icon_daituihuo"];
    }
    return _OrderImages;
}

-(NSArray *)OrderTitles
{
    
    if (!_OrderTitles) {
        _OrderTitles = @[@"待付款",@"待收货",@"待评价",@"待退货/退款"];
    }
    return _OrderTitles;
}



-(NSArray *)TreasureTitles
{
    if (!_TreasureTitles) {
        _TreasureTitles = @[@"现金券",@"红包",@"金额",@"礼品卡"];
    }

    return _TreasureTitles;
}
-(NSArray *)TreasureDetail
{
    if (!_TreasureDetail) {
        _TreasureDetail = @[@"7张",@"0个",@"￥0.00",@"￥0.00"];
    }
    return _TreasureDetail;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section==2||section==3) {
        return 1;
    }else
        
    return 2;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"profileCell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        
    }
    if (indexPath.row == 0) {
        
        cell.imageView.image = [[UIImage imageNamed:self.ImageArr[indexPath.section]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        cell.textLabel.text = self.TitleArr[indexPath.section];
        if (indexPath.section == 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.text = @"查看全部订单";
            cell.detailTextLabel.font = [UIFont systemFontOfSize:13.0f];
        }
        
    }
    /**我的订单 四个小标*/
    if (indexPath.row==1&&indexPath.section == 0) {

        for (int i = 0; i<self.OrderImages.count; i++) {
            ImageTitleButton *button = [ImageTitleButton buttonWithType:UIButtonTypeCustom];
            
            [button setImage:[UIImage imageNamed:self.OrderImages[i]] forState:UIControlStateNormal];
            [button setTitle:self.OrderTitles[i] forState:UIControlStateNormal];
            CGFloat buttonW = self.frame.size.width/4;
            CGFloat buttonH = 60;
            button.frame = CGRectMake(i*buttonW, 0, buttonW, buttonH);
            button.tag = i;
          [button bk_addEventHandler:^(id sender) {
              
              
              
              UIButton * but = (UIButton *)sender;
              NSLog(@"%@",but.titleLabel.text);
              
          } forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont systemFontOfSize:11];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:button];
            
        }
        
    }
    /**我的资产*/
    if (indexPath.section==1&&indexPath.row == 1) {
        for (int i = 0; i<self.TreasureDetail.count; i++){
        
            UIView *view = [[UIView alloc] init];
            CGFloat buttonW = self.frame.size.width/4;
            CGFloat buttonH = 60;
            view.frame = CGRectMake(i*buttonW, 0, buttonW, buttonH);
//            view.backgroundColor = RandomColor;
            CGPoint center = view.center;
            CGRect frame = view.frame;
            center.x = frame.size.width/2;
            center.y = frame.size.height/2/2+10;
            UILabel *TopLabel = [[UILabel alloc] init];
            TopLabel.width = frame.size.width;
            TopLabel.height = frame.size.height/2;
            TopLabel.center = center;
            TopLabel.textAlignment = NSTextAlignmentCenter;
            TopLabel.textColor = [UIColor blackColor];
            TopLabel.font = [UIFont systemFontOfSize:11];
            TopLabel.text = self.TreasureDetail[i];
            [view addSubview:TopLabel];
        
            UILabel *BottomLabel = [[UILabel alloc] init];
            BottomLabel.width = frame.size.width;;
            BottomLabel.height = frame.size.height/2;
            BottomLabel.centerX = frame.size.width/2;
            BottomLabel.centerY = frame.size.height/2+frame.size.height/2/2;
            BottomLabel.textColor = [UIColor blackColor];
            BottomLabel.font = [UIFont systemFontOfSize:11];
            BottomLabel.textAlignment = NSTextAlignmentCenter;
            [view addSubview:BottomLabel];
            
            BottomLabel.text = self.TreasureTitles[i];
            [cell.contentView addSubview:view];
        }
    
    }
    
    if (indexPath.section == 2||indexPath.section == 3) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    cell.textLabel.font = [UIFont systemFontOfSize:13.0f];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;



}
-(void)click:(UIButton *)sender{
    NSLog(@"点击了%@",sender.titleLabel);
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 2||indexPath.section == 3) {
        return 45.0f;
    }
    else if (indexPath.row == 0) {
        return 40.0f;
    }
    else{

        return 60.0f;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==2) {
        return 0;
    }else
    return 15.0f;

}



@end
