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
    TCTextView *textView = [[TCTextView alloc] init];
    textView.frame = CGRectMake(10, 25, ApplicationframeValue.width - 20, 200);
    textView.alwaysBounceVertical  = YES;
    textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    textView.layer.borderWidth = 0.5f;
    
    textView.placeholder = @"你的问题或建议";
    self.textView = textView;
    
    [self.view addSubview:textView];
    
    
    TCTextView *textView1 = [[TCTextView alloc] init];
    textView1.frame = CGRectMake(10, 25+200+20, ApplicationframeValue.width - 20, 40);
    textView1.alwaysBounceVertical  = YES;
    textView1.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    textView1.layer.borderWidth = 0.5f;
    
    textView1.placeholder = @"填写你的手机号，以便我们及时联系你";
    
    
    [self.view addSubview:textView1];
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, textView1.origin.y+40+30, ApplicationframeValue.width - 20, 45)];
    [button setTitle:@"发表建议" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    [self.view addSubview:button];
    
    
    
    
    
    
}




@end
