//
//  TCOrderCell.h
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.


//订单cell

#import <UIKit/UIKit.h>

@interface TCOrderCell : UITableViewCell
/**图片*/
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
/**产品名称*/
@property (strong, nonatomic) IBOutlet UILabel *ProductNameLabel;
/**价格*/
@property (strong, nonatomic) IBOutlet UILabel *PriceLabel;
/**数量*/
@property (strong, nonatomic) IBOutlet UILabel *Count;
/**立即购买*/
@property (strong, nonatomic) IBOutlet UIButton *BuyNowButton;
@property (nonatomic ,assign,getter = isPay) BOOL pay;
@end
