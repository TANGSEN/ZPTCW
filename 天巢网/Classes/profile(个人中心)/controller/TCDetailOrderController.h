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

@property (strong, nonatomic) IBOutlet UIView *Table;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView1;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView4;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView5;
@property (strong, nonatomic) IBOutlet UIImageView *lineImageView6;


@property (strong, nonatomic) IBOutlet UIImageView *lineImageView7;

@property (strong, nonatomic) IBOutlet UIImageView *lineImageView8;

@property (strong, nonatomic) IBOutlet UIView *TopView;
@property (strong, nonatomic) IBOutlet UILabel *NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *PhoneLabel;
@property (strong, nonatomic) IBOutlet UILabel *AddressLabel;

@property (strong, nonatomic) IBOutlet UIButton *NoPay;


@property (strong, nonatomic) IBOutlet UIButton *GoPay;
@property (strong, nonatomic) IBOutlet UIView *StepperView;

@end
