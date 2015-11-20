//
//  TCDetailOrderController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCDetailOrderController.h"

@interface TCDetailOrderController ()
{

    NSInteger count;

}
@end

@implementation TCDetailOrderController
- (IBAction)DecreaseButton:(id)sender {
    count --;
    if (count==0) {
        count = 1;
    }
    
    self.CountLabel.text = [NSString stringWithFormat:@"%ld",(long)count];
    self.PriceLabel.text = @"39.00";
    float preSum =[self.PriceLabel.text floatValue]*[self.CountLabel.text intValue];
    self.PreSumLabel.text = [NSString stringWithFormat:@"%.2f",preSum];
    
    self.PreCountLabel.text = [NSString stringWithFormat:@"%ld",count];
}




- (IBAction)PlusButton:(id)sender {
    
    count++;
//    NSString *countStr = [NSString stringWithFormat:@"%ld",(long)count];
//    
//    self.CountLabel.text = countStr;
    
//    self.PreCountLabel.text = [NSString stringWithFormat:@"共%ld件商品  合计：",count];
//    NSInteger price = (NSInteger)self.PriceLabel.text;
//    NSString *preSumStr  = [NSString stringWithFormat:@"%ld",count * price];
//    self.PreSumLabel.text = preSumStr;
    
    self.CountLabel.text = [NSString stringWithFormat:@"%ld",(long)count];
    self.PriceLabel.text = @"39.00";
    float preSum =[self.PriceLabel.text floatValue]*[self.CountLabel.text intValue];
    self.PreSumLabel.text = [NSString stringWithFormat:@"%.2f",preSum];
    
    self.PreCountLabel.text = [NSString stringWithFormat:@"%ld",count];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.view.backgroundColor = View_BgColor;
    count = 1;
    self.CountLabel.text = [NSString stringWithFormat:@"%ld",(long)count];
    self.PriceLabel.text = @"39.00";
    float preSum =[self.PriceLabel.text floatValue]*[self.CountLabel.text intValue];
    self.PreSumLabel.text = [NSString stringWithFormat:@"%.2f",preSum];
    
    self.PreCountLabel.text = [NSString stringWithFormat:@"%ld",count];
    

    self.lineImageView.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView1.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView2.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView3.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView4.backgroundColor = Color_Hex16(@"#f0f0f0");
    self.lineImageView5.backgroundColor = Color_Hex16(@"#f0f0f0");
    
    self.lineImageView7.backgroundColor = [UIColor lightGrayColor];
    self.lineImageView8.backgroundColor = [UIColor lightGrayColor];
    self.view.backgroundColor = View_BgColor;
    
    self.NameLabel.font = AppFont(text_size_big_3);
    
    self.PhoneLabel.font = AppFont(text_size_big_3);
    
    self.AddressLabel.font = AppFont(text_size_other);
    self.AddressLabel.textColor = Color_Common;
    
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, ApplicationframeValue.height-50-64)];
    self.scrollV.contentSize = CGSizeMake(ApplicationframeValue.width, 145+320+15+15);
    self.scrollV.backgroundColor =[UIColor clearColor];
    [self.view addSubview:self.scrollV];
    
    self.scrollV.showsHorizontalScrollIndicator = NO;
    self.scrollV.showsVerticalScrollIndicator = NO;
    self.TopView.frame = CGRectMake(0, 0, ApplicationframeValue.width, 145);
     [self.scrollV addSubview:self.TopView];
    self.Table.frame = CGRectMake(0, 160, ApplicationframeValue.width, 320);
    [self.scrollV addSubview:self.Table];
    
    
    
    
    /*********************************************************************/
    // blockskit功能小试
    UIButton *btn = [[UIButton alloc]init];
    btn.x = 0;
    btn.y = 300;
    btn.width = JPScreenW;
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
    vView.layer.cornerRadius = 3.0f;
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
