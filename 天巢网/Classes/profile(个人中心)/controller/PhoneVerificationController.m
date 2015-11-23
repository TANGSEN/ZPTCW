//
//  PhoneVerificationController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "PhoneVerificationController.h"

@interface PhoneVerificationController ()

@end

@implementation PhoneVerificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手机验证";
    self.view.backgroundColor = View_BgColor;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 40, ApplicationframeValue.width-100, 40)];
    [self.view addSubview:textField];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"输入手机验证码";
    textField.font = AppFont(text_size_little_2);
    textField.layer.borderWidth = 0.4f;
    textField.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ApplicationframeValue.width-100, 40, 100, 40)];
    
    [self.view addSubview:button];
    
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderWidth = 0.4f;
    button.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    button.titleLabel.font = AppFont(text_size_little_2);
    [button bk_addEventHandler:^(id sender) {
        
        NSLog(@"PhoneVerificationController正在获取验证码");
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *complishBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, button.origin.y+40+50, ApplicationframeValue.width - 20, 45)];
    [complishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [complishBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [complishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:complishBtn];
    
    [complishBtn bk_addEventHandler:^(id sender) {
        if (!textField.text.length) {
            AlertLog(@"", @"请输入手机验证码", @"确定", nil);
        }
        else{
        
        
        }
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
