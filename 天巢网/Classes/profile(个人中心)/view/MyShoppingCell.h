//
//  MyShoppingCell.h
//  天巢网
//
//  Created by 赵贺 on 15/11/24.
//  Copyright © 2015年 tangjp. All rights reserved.


//我的购物车 cell

#import <UIKit/UIKit.h>

@interface MyShoppingCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *StepperView;
@property (strong, nonatomic) IBOutlet UIImageView *Imageline1;
@property (strong, nonatomic) IBOutlet UIImageView *Imageline2;
/**产品描述*/
@property (weak, nonatomic) IBOutlet UILabel *ProductDetailLabel;
@property (weak, nonatomic) IBOutlet UIButton *ChooseButton;
/**产品价格*/
@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
/**已售*/
@property (weak, nonatomic) IBOutlet UILabel *SoldCount;
@property (weak, nonatomic) IBOutlet UIButton *PlusButton;
@property (weak, nonatomic) IBOutlet UIButton *DecreaseButton;
/**数量*/
@property (weak, nonatomic) IBOutlet UILabel *Count;
@property (weak, nonatomic) IBOutlet UIButton *CancelButton;

@end
