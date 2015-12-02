//
//  MyShoppingController.h
//  天巢网
//
//  Created by 赵贺 on 15/11/24.
//  Copyright © 2015年 tangjp. All rights reserved.


//我的购物车

#import <UIKit/UIKit.h>

@interface MyShoppingController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *PreSumLabel;
@property (weak, nonatomic) IBOutlet UIButton *CountButton;

/**底部视图*/
@property (strong, nonatomic) IBOutlet UIView *BottomView;

@end
