//
//  FeedbackViewController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "FeedbackViewController.h"
#import "TCTextView.h"
@interface FeedbackViewController ()
@property (nonatomic,strong)TCTextView *textView;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTextView];
    
}
//添加输入控件
-(void)setupTextView
{
    TCTextView *adviceText = [[TCTextView alloc] init];
    adviceText.frame = CGRectMake(10, 25, ApplicationframeValue.width - 20, 200);
    adviceText.alwaysBounceVertical  = YES;
//    adviceText.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    adviceText.layer.borderWidth = 0.5f;
    
    adviceText.placeholder = @"您的问题或建议";
    self.textView = adviceText;
    
    [self.view addSubview:adviceText];
    
    
    
    TCTextView *phoneText = [[TCTextView alloc] init];
    phoneText.frame = CGRectMake(10, 25+200+20, ApplicationframeValue.width - 20, 40);
    phoneText.alwaysBounceVertical  = YES;
//    phoneText.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    
//    phoneText.layer.borderWidth = 0.5f;
    
    phoneText.placeholder = @"填写您的手机号，以便我们及时联系您";

    [self.view addSubview:phoneText];
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, phoneText.origin.y+40+30, ApplicationframeValue.width - 20, 45)];
    [button setTitle:@"发表建议" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self.view addSubview:button];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
}


@end
