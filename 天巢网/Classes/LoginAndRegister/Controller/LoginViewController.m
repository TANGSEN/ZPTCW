//
//  LoginViewController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/27.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "TCProfileController.h"
@interface LoginViewController ()
/**输入的手机号*/
@property(nonatomic,strong)UITextField *phoneText;
/**输入的密码*/
@property(nonatomic,strong)UITextField *password;
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic,strong)NSArray *titleArr;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = View_BgColor;
//    self.title = @"登录";
    self.navigationItem.title = @"登录";
    self.tableView.frame = CGRectMake(0, 0, ApplicationframeValue.width, 140);
    /**登录按钮*/
    UIButton *LoginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.tableView.frame)+30, ApplicationframeValue.width , 40)];
    [LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [LoginBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [LoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [LoginBtn bk_addEventHandler:^(id sender) {
//        if (!self.phoneText.text.length) {
//            AlertLog(nil, @"请输入手机号码", @"确定", nil);
//            return ;
//        }
//        if (!self.password.text.length) {
//            AlertLog(nil, @"请输入密码", @"确定", nil);
//            return ;
//        }
//        
//       NSString *phoneNumber = [[NSUserDefaults standardUserDefaults]objectForKey:@"userName"];
//       NSString *password = [[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
//       [[NSUserDefaults standardUserDefaults]synchronize];
//
//        if (![phoneNumber isEqualToString:self.phoneText.text]||![password isEqualToString:self.password.text]) {
//            AlertLog(nil, @"输入的手机号或者密码不正确", @"确认", nil);
//            return;
//        }
        [SharedInstance sharedInstance].alreadyLanded = YES;
//        TCProfileController *profile = [[TCProfileController alloc] init];
//        
//        [self presentViewController:self.tabBarController animated:YES completion:nil];
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];

//        [self.navigationController pushViewController:profile animated:YES];
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    [self.view addSubview:LoginBtn];
    
    
    /**立即注册*/
    UIButton *RegisterBtn = [[UIButton alloc] initWithFrame:CGRectMake(ApplicationframeValue.width-80, CGRectGetMaxY(LoginBtn.frame), 80, 30)];
    [RegisterBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    [RegisterBtn setTitleColor:Color_LightGray forState:UIControlStateNormal];
    
    [RegisterBtn bk_addEventHandler:^(id sender) {
        RegisterViewController *registe = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:registe animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    RegisterBtn.titleLabel.font = AppFont(text_size_little_1);
    /**忘记密码*/
    UIButton *forgetBtn = [[UIButton alloc] initWithFrame:CGRectMake(RegisterBtn.frame.origin.x-80, CGRectGetMaxY(LoginBtn.frame), 80, 30)];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:Color_LightGray forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = AppFont(text_size_little_1);
    
     [self.view addSubview:RegisterBtn];
     [self.view addSubview:forgetBtn];

}
-(NSArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = [NSArray arrayWithObjects:@"注册-1_07",@"注册-1_15", nil];
    }
    return _imageArr;
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageArr[indexPath.row]]];
    imageView.frame = CGRectMake(15, 15, 15, 25);
    [cell.contentView addSubview:imageView];
    
    
    if (indexPath.row==0) {
        self.phoneText = [[UITextField alloc] initWithFrame:CGRectMake(45, 5, ApplicationframeValue.width-45, 45)];
        self.phoneText.font = AppFont(text_size_little_2);
        self.phoneText.placeholder = @"输入手机号码";
        self.phoneText.delegate = self;
        [cell.contentView addSubview:self.phoneText];
    }
    else{
        self.password = [[UITextField alloc] initWithFrame:CGRectMake(45, 5, ApplicationframeValue.width-45-100, 45)];
        self.password.font = AppFont(text_size_little_2);
        self.password.delegate = self;
        self.password.placeholder = @"输入密码";
        [cell.contentView addSubview:self.password];
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

@end
