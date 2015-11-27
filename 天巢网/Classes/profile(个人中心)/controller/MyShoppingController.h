//
//  MyShoppingController.h
//  天巢网
//
//  Created by 赵贺 on 15/11/24.
//  Copyright © 2015年 tangjp. All rights reserved.


//我的购物车

#import <UIKit/UIKit.h>

@interface MyShoppingController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *PreSumLabel;
@property (weak, nonatomic) IBOutlet UIButton *CountButton;
/**全选按钮*/
@property (weak, nonatomic) IBOutlet UIButton *BottomButton;

@end
