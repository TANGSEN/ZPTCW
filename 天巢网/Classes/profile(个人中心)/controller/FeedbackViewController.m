//
//  FeedbackViewController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "FeedbackViewController.h"
#import "TCTextView.h"
@interface FeedbackViewController ()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic,strong)TCTextView *textView;
@property (nonatomic,strong)UITextField *phoneText;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.frame = [[UIScreen mainScreen]bounds];

    [self.view setUserInteractionEnabled:YES];
    /**添加输入控件*/
    [self setupTextView];
    
}



#pragma mark - 添加输入控件
-(void)setupTextView
{
   
    /**反馈意见*/
    TCTextView *adviceText = [[TCTextView alloc] initWithFrame:CGRectMake(10, 25, ApplicationframeValue.width - 20, 200)];
    adviceText.alwaysBounceVertical  = YES;

    adviceText.delegate = self;
    adviceText.placeholder = @"您的问题或建议";
    self.textView = adviceText;
    adviceText.tag = 0;
    [self.view addSubview:adviceText];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapdown)];
    [self.view addGestureRecognizer:tapGR];
    /**手机号*/
    UITextField *phoneText = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(adviceText.frame)+20, ApplicationframeValue.width - 20, 45)];
    self.phoneText = phoneText;
    phoneText.delegate = self;
    phoneText.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
    phoneText.font = AppFont(text_size_little_2);
    phoneText.layer.borderWidth = 0.4f;
    phoneText.tag = 1;
    phoneText.placeholder = @"  填写您的手机号，以便我们及时联系您";
    [self.view addSubview:phoneText];
    
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, phoneText.origin.y+40+30, ApplicationframeValue.width - 20, 45)];
    [button setTitle:@"发表建议" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    [self.view addSubview:button];
   
}

-(void)tapdown{
    [self.phoneText resignFirstResponder];
    [self.textView resignFirstResponder];
    
}
#pragma mark - textField Delegate
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
    [self returnKey];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{

        float offset=-100.0f;
        
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyBoard"context:nil];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        float width = self.view.frame.size.width;
        float height = ApplicationframeValue.height;
        CGRect rect = CGRectMake(0.0f,offset , width, height);
        self.view.frame = rect;
        [UIView commitAnimations];
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [self returnKey];
    
    return YES;
}

/**判断view的Y来调整整个视图的Y*/
- (void)returnKey
{
    
    float y=self.view.frame.origin.y;
    if(y==-100)
    {
        float offset = iOS7?64.0f:0.0f;
        NSTimeInterval animationDuration = 0.30f;
        [UIView beginAnimations:@"ResizeForKeyBoard"context:nil];
        [UIView setAnimationDuration:animationDuration];
        float width = self.view.frame.size.width;
        float height = ApplicationframeValue.height;
        CGRect rect = CGRectMake(0.0f,offset , width, height);
        self.view.frame = rect;
        [UIView commitAnimations];
    }
    else{
    
    }
}

#pragma mark - TextView delegate
-(void)textViewDidBeginEditing:(UITextView *)textView
{

    [self returnKey];

}


/**textview 没有textField的return 可根据下列进行判断*/
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
