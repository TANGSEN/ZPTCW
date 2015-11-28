//
//  RegisterViewController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/27.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "RegisterViewController.h"
#import "CountDownButton.h"
#import "TCProfileController.h"
@interface RegisterViewController ()
@property (nonatomic,strong)NSArray *imageArr;
/**输入的手机号*/
@property(nonatomic,strong)UITextField *phoneText;
/**输入的验证码*/
@property(nonatomic,strong)UITextField *phoneCode;
/**输入的密码*/
@property(nonatomic,strong)UITextField *code;
/**确认密码*/
@property(nonatomic,strong)UITextField *vertifyCode;
/**计数器*/
@property (nonatomic,strong)CountDownButton *CountDownBtn;
@end

@implementation RegisterViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = View_BgColor;
    self.title = @"注册";
    self.tableView.frame = CGRectMake(0, 0, ApplicationframeValue.width, 280);
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame)+30, ApplicationframeValue.width , 40)];
    [button setTitle:@"完成注册" forState:UIControlStateNormal];
    
#warning 按钮的状态暂时没有设置
//    if (!self.phoneText.text.length||!self.phoneCode.text.length||!self.code.text.length||!self.vertifyCode.text.length) {
//        button.enabled = NO;
//    }else{
//        button.enabled = YES;
//    }
    
    [button bk_addEventHandler:^(id sender) {
        /**验证码校验*/
        if (!self.phoneCode.text.length){
    
            AlertLog(nil, @"请输入验证码", @"确定", nil);
            return ;
            
        }
        
        if (!self.code.text.length||!self.vertifyCode.text.length) {
            AlertLog(nil, @"请输入密码", @"确定", nil);
            return;
        }
        
        if (![self.code.text isEqualToString:self.vertifyCode.text]) {
            
            [self.CountDownBtn stop];
            AlertLog(nil, @"两次输入的密码不同", @"确定", nil);
            return;
            
        }
      
        

        [SMSSDK commitVerificationCode:self.phoneCode.text phoneNumber:self.phoneText.text zone:@"86" result:^(NSError *error) {
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
            [[NSUserDefaults standardUserDefaults]setObject:self.phoneText.text forKey:@"userName"];
                
             [[NSUserDefaults standardUserDefaults]setObject:self.code.text forKey:@"password"];
                
             [[NSUserDefaults standardUserDefaults]synchronize];
            
            /**标记已经登录*/
            [SharedInstance sharedInstance].alreadyLanded = YES;
                
        
            TCProfileController *profile = [[TCProfileController alloc] init];
            [self presentViewController:profile animated:YES completion:nil];
                
         
            }
        }];

    } forControlEvents:UIControlEventTouchUpInside];
    
    
    [button setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"2-属性_12"] forState:UIControlStateDisabled];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    [self.view addSubview:button];
}
-(NSArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = [NSArray arrayWithObjects:@[@"注册-1_07",@"注册-1_11"],@[@"注册-1_15",@"注册-1_18"], nil];
    }
    return _imageArr;
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
 

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageArr[indexPath.section][indexPath.row]]];
    imageView.frame = CGRectMake(15, 15, 15, 25);
    [cell.contentView addSubview:imageView];
    
    if (indexPath.section==0) {
   
        if (indexPath.row==0) {
            self.phoneText = [[UITextField alloc] initWithFrame:CGRectMake(45, 5, ApplicationframeValue.width-45, 45)];
            self.phoneText.font = AppFont(text_size_little_2);
            self.phoneText.placeholder = @"输入手机号码";
            self.phoneText.delegate = self;
            [cell.contentView addSubview:self.phoneText];
        }
        else{
            self.phoneCode = [[UITextField alloc] initWithFrame:CGRectMake(45, 5, ApplicationframeValue.width-45-100, 45)];
            self.phoneCode.font = AppFont(text_size_little_2);
            self.phoneCode.delegate = self;
            self.phoneCode.placeholder = @"输入手机验证码";
            self.CountDownBtn = [[CountDownButton alloc] initWithFrame:CGRectMake(ApplicationframeValue.width-100, 0, 100, 55)];
            [cell.contentView addSubview:self.CountDownBtn];
            
            [cell.contentView addSubview:self.phoneCode];
            
            [self.CountDownBtn bk_addEventHandler:^(id sender) {
                NSLog(@"number%@",self.phoneText.text);
                if (!self.phoneText.text.length) {
                    AlertLog(nil, @"请输入您的手机号", @"确定", nil);
                }else{
                    [self.CountDownBtn beginCountDown];
                    /**发送验证码*/
                    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneText.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
                        if (error) {
                            NSLog(@"error %@", error);
                        }else{
                            NSLog(@"验证码发送成功");
                        }
                    }];
                }
            } forControlEvents:UIControlEventTouchUpInside];
  
        }
    }
    
    
    if (indexPath.section==1) {
        
        if (indexPath.row==0) {
            self.code = [[UITextField alloc] initWithFrame:CGRectMake(45, 5, ApplicationframeValue.width-45, 45)];
            self.code.delegate = self;
            self.code.font = AppFont(text_size_little_2);
            self.code.placeholder = @"输入密码";
            self.code.secureTextEntry =YES;
            [cell.contentView addSubview:self.code];
        }
        else{
            self.vertifyCode = [[UITextField alloc] initWithFrame:CGRectMake(45, 5, ApplicationframeValue.width-45-100, 45)];
            self.vertifyCode.delegate = self;
            self.vertifyCode.secureTextEntry = YES;
            self.vertifyCode.font = AppFont(text_size_little_2);
            self.vertifyCode.placeholder = @"确认密码";
            [cell.contentView addSubview:self.vertifyCode];
        }
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.layer.borderColor = [[[UIColor lightGrayColor]colorWithAlphaComponent:0.3] CGColor];
    cell.layer.borderWidth = 0.4f;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0f;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55.0f;
}

#pragma mark - textField Delegate
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
