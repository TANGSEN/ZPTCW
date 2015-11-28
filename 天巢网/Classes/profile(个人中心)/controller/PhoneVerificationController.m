//
//  PhoneVerificationController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "PhoneVerificationController.h"
#import "CountDownButton.h"
@interface PhoneVerificationController ()
/**计数器*/
@property (nonatomic,strong)CountDownButton *CountDownBtn;
@end

@implementation PhoneVerificationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"手机验证";
    self.view.backgroundColor = View_BgColor;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 40, ApplicationframeValue.width-100, 40)];
    [self.view addSubview:textField];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"  输入手机验证码";
    textField.font = AppFont(text_size_little_2);
    textField.layer.borderWidth = 0.4f;
    textField.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    
    
    
    
    self.CountDownBtn = [[CountDownButton alloc] initWithFrame:CGRectMake(ApplicationframeValue.width-100, 40, 100, 40)];
    [self.view addSubview:self.CountDownBtn];
    
    
    [self.CountDownBtn bk_addEventHandler:^(id sender) {
        
            [self.CountDownBtn beginCountDown];
            /**发送验证码*/
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneNumber zone:@"86" customIdentifier:nil result:^(NSError *error) {
                if (error) {
                    NSLog(@"error %@", error);
                }else{
                    NSLog(@"验证码发送成功");
                }
            }];
    } forControlEvents:UIControlEventTouchUpInside];
    

    
   
    
    UIButton *complishBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, self.CountDownBtn.origin.y+40+50, ApplicationframeValue.width - 20, 45)];
    [complishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [complishBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [complishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:complishBtn];
    
    [complishBtn bk_addEventHandler:^(id sender) {
        
        if (!textField.text.length) {
            AlertLog(@"", @"请输入手机验证码", @"确定", nil);
        }
        else{
            
        [SMSSDK commitVerificationCode:textField.text phoneNumber:self.phoneNumber zone:@"86" result:^(NSError *error) {
                if (error) {
                    NSLog(@"验证码不正确 %@", error);
                    AlertLog(nil, @"验证码不正确", @"确定", nil);
                    /**倒计时停止，重新发送*/
                    [self.CountDownBtn stop];
                    
                }else{
                    NSLog(@"验证码正确");
                    [self.CountDownBtn stop];
                    /**
                     在此存储手机号和密码，进入个人中心*/
                    [[NSUserDefaults standardUserDefaults]setObject:self.phoneNumber forKey:@"userName"];
                    
                    [[NSUserDefaults standardUserDefaults]synchronize];
                    
                    /**标记已经登录*/
                    NSString *message = [NSString stringWithFormat:@"已为您重新绑定手机号\n%@",self.phoneNumber];
                    AlertLog(@"温馨提示", message, @"好", nil);
    
                    
                    [self.navigationController popToRootViewControllerAnimated:YES];
    
                }
            }];
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
