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
    
   
    
    
    
    [self getRoundCorner:self.StepperView];
    
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
