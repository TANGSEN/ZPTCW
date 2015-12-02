//
//  EmailBindingController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "EmailBindingController.h"
#import "CountDownButton.h"

@interface EmailBindingController ()
@property (nonatomic,strong)UITextField *textField;
@property (nonatomic,strong)UITextField *text;
@end


@implementation EmailBindingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = View_BgColor;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR)];
    
    
    [self.view addGestureRecognizer:tap];
    /**输入邮箱号*/
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 30, ApplicationframeValue.width-100, 45)];
    [self.view addSubview:textField];
    textField.delegate = self;
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = @"  输入邮箱号";
    textField.font = AppFont(text_size_little_2);
    textField.layer.borderWidth = 0.4f;
    textField.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    self.textField = textField;
    /**获取验证码（倒计时）*/
    CountDownButton *button = [[CountDownButton alloc] initWithFrame:CGRectMake(ApplicationframeValue.width-100, 30, 100, 45)];
    
    [self.view addSubview:button];
    
    [button bk_addEventHandler:^(id sender) {
        
        NSString *alert = [NSString stringWithFormat:@"我们将发送校检码到这个邮箱\n请注意查收\n%@",textField.text];
        
        if (!textField.text.length) {
            AlertLog(@"", @"请输入邮箱号", @"确定", nil);
        }
        else{
            AlertLog(@"确认邮箱号码", alert, @"好", nil);

            [button beginCountDown];
        }
   
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    /**输入邮箱验证码*/
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(0, button.origin.y+45+15, ApplicationframeValue.width, 45)];
    [self.view addSubview:text];
    text.delegate = self;
    text.backgroundColor = [UIColor whiteColor];
    text.placeholder = @"  输入邮箱验证码";
    self.text = text;
    text.font = AppFont(text_size_little_2);
    text.layer.borderWidth = 0.4f;
    text.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    
    
    
    /**确认绑定按钮*/
    UIButton *complishBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, text.origin.y+45+30, ApplicationframeValue.width - 20, 45)];
    [complishBtn setTitle:@"确认绑定" forState:UIControlStateNormal];
    [complishBtn setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [complishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:complishBtn];
    
    [complishBtn bk_addEventHandler:^(id sender) {
        if (!textField.text.length) {
            AlertLog(@"", @"请输入验证码", @"确定", nil);
        }
        else{
            
            
        }
    } forControlEvents:UIControlEventTouchUpInside];

}

-(void)tapGR{
    
    [self.text resignFirstResponder];
    [self.textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;

}

@end
