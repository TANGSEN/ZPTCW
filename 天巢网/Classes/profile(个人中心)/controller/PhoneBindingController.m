//
//  PhoneBindingController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "PhoneBindingController.h"
#import "TCTextView.h"
#import "PhoneVerificationController.h"
@interface PhoneBindingController ()

@end

@implementation PhoneBindingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTextView];
    self.view.backgroundColor = View_BgColor;

}
-(void)addTextView
{
    UITextField *oldPhoneText = [[UITextField alloc] initWithFrame:CGRectMake(0, 20, ApplicationframeValue.width,45)];
    oldPhoneText.backgroundColor = [UIColor whiteColor];
    oldPhoneText.placeholder = @"  输入旧手机号";
    oldPhoneText.font = AppFont(text_size_little_2);
    oldPhoneText.layer.borderWidth = 0.4f;
    oldPhoneText.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    [self.view addSubview:oldPhoneText];
    

    UITextField *newPhoneText = [[UITextField alloc] initWithFrame:CGRectMake(0, 80, ApplicationframeValue.width,45 )];
    newPhoneText.backgroundColor = [UIColor whiteColor];
    newPhoneText.placeholder = @"  输入新手机号";
    newPhoneText.font = AppFont(text_size_little_2);
    newPhoneText.layer.borderWidth = 0.4f;
    newPhoneText.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    [self.view addSubview:newPhoneText];
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, newPhoneText.origin.y+40+30, ApplicationframeValue.width - 20, 40)];
    [button setTitle:@"下一步" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];

[button bk_addEventHandler:^(id sender) {
    PhoneVerificationController *verification = [[PhoneVerificationController alloc] init];
    verification.phoneNumber = newPhoneText.text;
    [self.navigationController pushViewController:verification animated:YES];
} forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
