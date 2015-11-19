//
//  TCDetailOrderController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCDetailOrderController.h"

@interface TCDetailOrderController ()

@end

@implementation TCDetailOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.view.backgroundColor = View_BgColor;
    

    self.lineImageView.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView1.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView2.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView3.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView4.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView5.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView6.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView7.backgroundColor = [UIColor lightGrayColor];
    self.lineImageView8.backgroundColor = [UIColor lightGrayColor];
    self.view.backgroundColor = View_BgColor;
    
    self.NameLabel.font = AppFont(text_size_big_3);
    
    self.PhoneLabel.font = AppFont(text_size_big_3);
    
    self.AddressLabel.font = AppFont(text_size_other);
    self.AddressLabel.textColor = Color_Common;
    
    // navigation遇到scrollV会自动把scrollV的y值设置成64，所以要想让scrollV显示完全要把scrollV的height减掉一部分，这里又有一个付款按钮会挡住一部分scrollV，所以还要减去付款按钮的height，这样就能把scrollV完全显示了。
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.size.width, ApplicationframeValue.size.height - 50 - 55)];
    self.scrollV.contentSize = CGSizeMake(ApplicationframeValue.size.width, 154+411+20);
    self.scrollV.backgroundColor =[UIColor clearColor];
    [self.view addSubview:self.scrollV];
    
    
    self.TopView.frame = CGRectMake(0, 0, ApplicationframeValue.size.width, 154);
     [self.scrollV addSubview:self.TopView];
    self.Table.frame = CGRectMake(0, 164, ApplicationframeValue.size.width, 411);
    [self.scrollV addSubview:self.Table];
    
    
    
    
    /*********************************************************************/
    // blockskit功能小试
    UIButton *btn = [[UIButton alloc]init];
    btn.x = 0;
    btn.y = 300;
    btn.Width = JPScreenW;
    btn.height = 120;
    btn.backgroundColor = RandomColor;
    btn.titleLabel.numberOfLines = 0;
    [btn setTitle:@"***********这是一个按钮**********\n使用blockskit框架把[btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside]用block实现" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    // 给按钮添加点击事件.使用block
    [btn bk_addEventHandler:^(id sender) {
        NSLog(@"点击了btn按钮，使用blockskit框架把[btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside]用block实现");
    } forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    /*********************************************************************/
    
    
    
    
    [self getRoundCorner:self.StepperView];
    self.scrollV.bounces = NO;
    NSLog(@"%@",NSStringFromCGRect(self.scrollV.frame));
}

-(UIView *)getRoundCorner:(UIView *)vView
{
    vView.layer.borderWidth  = 1.0f;
    vView.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5].CGColor;
    vView.layer.cornerRadius = 6.0f;
    [vView.layer setMasksToBounds:YES];


    return nil;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
