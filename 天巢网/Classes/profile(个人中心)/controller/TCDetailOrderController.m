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
    
    self.scrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.size.width, ApplicationframeValue.size.height)];
    self.scrollV.contentSize = CGSizeMake(ApplicationframeValue.size.width, 154+411+20);
    self.scrollV.backgroundColor =[UIColor clearColor];
    [self.view addSubview:self.scrollV];
    
    
    self.TopView.frame = CGRectMake(0, 0, ApplicationframeValue.size.width, 154);
     [self.scrollV addSubview:self.TopView];
    self.Table.frame = CGRectMake(0, 164, ApplicationframeValue.size.width, 411);
    [self.scrollV addSubview:self.Table];
    
   
    
    
    
    [self getRoundCorner:self.StepperView];
    
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
