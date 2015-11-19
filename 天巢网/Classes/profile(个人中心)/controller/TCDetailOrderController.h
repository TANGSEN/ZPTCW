//
//  TCDetailOrderController.h
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCDetailOrderController : UIViewController
@property (nonatomic, strong) UIScrollView *scrollV;
/**中间视图*/
@property (strong, nonatomic) IBOutlet UIView *Table;
/**箭头--应该还可以推出详情页*/
@property (strong, nonatomic) IBOutlet UIButton *TopButton;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView1;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView4;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView5;


@property (strong, nonatomic) IBOutlet UIImageView *lineImageView7;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView8;
/**个人信息*/
@property (strong, nonatomic) IBOutlet UIView *TopView;
@property (strong, nonatomic) IBOutlet UILabel *NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *PhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *AddressLabel;
/**未付款*/
@property (strong, nonatomic) IBOutlet UIButton *NoPay;

/**去付款*/
@property (strong, nonatomic) IBOutlet UIButton *GoPay;
/**stepper*/
@property (strong, nonatomic) IBOutlet UIView *StepperView;
@property (strong, nonatomic) IBOutlet UIButton *PlusButton;

@property (strong, nonatomic) IBOutlet UIButton *DecreaseButton;

/**数量*/
@property (strong, nonatomic) IBOutlet UILabel *CountLabel;
/**单价*/
@property (strong, nonatomic) IBOutlet UILabel *PriceLabel;
/**总价*/
@property (strong, nonatomic) IBOutlet UILabel *PreSumLabel;
/**多少件*/
@property (strong, nonatomic) IBOutlet UILabel *PreCountLabel;


@end
