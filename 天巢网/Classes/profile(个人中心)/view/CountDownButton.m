//
//  CountDownButton.m
//  天巢网
//
//  Created by 赵贺 on 15/11/24.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "CountDownButton.h"
@interface CountDownButton()
@property (nonatomic,strong)NSTimer *countTime;
@property (assign, nonatomic) int remainTime;

@end
@implementation CountDownButton

-(id)initWithFrame:(CGRect)frame
{

    self  = [super initWithFrame:frame];
    if (self) {
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 0.4f;
        self.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
        self.titleLabel.font = AppFont(text_size_little_2);
        
    }
    
    
    
    return self;
}

-(void)beginCountDown
{
    self.countTime = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(reduce) userInfo:nil repeats:YES];
    self.remainTime = 60;
    self.enabled = NO;
    NSString *title = [NSString stringWithFormat:@"已发送(%ds)",self.remainTime];
    [self setTitle:title forState:UIControlStateDisabled];
    [self setTitleColor:Color_LightGray forState:UIControlStateDisabled];


}
/**倒计时*/
-(void)reduce{
    
    self.remainTime--;
    if (self.remainTime<=1) {
        self.enabled = YES;
        
        [self.countTime invalidate];
       [self setTitle:@"重新获取" forState:UIControlStateNormal];
   
    }
    else{
    
        self.enabled = NO;
        NSString *title = [NSString stringWithFormat:@"已发送(%ds)",self.remainTime];
        [self setTitle:title forState:UIControlStateDisabled];
    
    
    }
    
    
}
-(void)stop{
    [self.countTime invalidate];
    
    [self setTitle:@"重新获取" forState:UIControlStateNormal];
    self.enabled = YES;
    self.selected = NO;
    
    
    
}

@end
