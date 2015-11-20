//
//  EvaluationView.m
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "EvaluationView.h"
#define Margin (ApplicationframeValue.width-20)/14
@implementation EvaluationView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
        [self.overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *viewS = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width-20, ApplicationframeValue.height-150)];
        viewS.backgroundColor =[UIColor whiteColor];
        [self addSubview:viewS];
        self.viewS = viewS;
        
        
        UILabel *TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((ApplicationframeValue.width-20-100)/2, 25, 100, 25)];
        TitleLabel.textAlignment = NSTextAlignmentCenter;
        TitleLabel.text = @"商品评价";
        TitleLabel.backgroundColor = [UIColor clearColor];
        TitleLabel.font = AppFont(text_size_middle_2);
        [viewS addSubview:TitleLabel];
        
        NSArray *arr = @[@"质量评价:",@"配送评价:",@"安装评价:",@"自由评价:"];
        for (int i = 0; i<4; i++) {
            
            
            UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(Margin/2, 70+2*Margin*i, 5*Margin/2, Margin)];
            
            leftLabel.text = arr[i];
            leftLabel.textAlignment = NSTextAlignmentCenter;
            leftLabel.adjustsFontSizeToFitWidth = YES;
            leftLabel.font = AppFont(text_size_other);
            [viewS addSubview:leftLabel];
            if (i == 3) {
                UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(4*Margin, 70+2*Margin*3, ApplicationframeValue.width-5*Margin-20, 3*Margin)];
                textView.backgroundColor = View_BgColor;
                [viewS addSubview:textView];
            }
            else{
                
                for (int j = 0; j<5; j++) {
                    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(4*Margin+2*j*Margin, 70+2*Margin*i, Margin, Margin)];
                
                    [button setBackgroundImage: [UIImage imageNamed:@"5-我的订单-评价_07"] forState:UIControlStateNormal];
                    [button setBackgroundImage:[UIImage imageNamed:@"5-我的订单-评价_03"] forState:UIControlStateSelected];
                    [viewS addSubview:button];
                    button.selected = NO;
                    button.tag = 100*i + j;
                    [button addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchUpInside];
                    
                }
            }
        }
        
        
        
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleBtn.frame = CGRectMake(2*Margin, 70+10*Margin, ApplicationframeValue.width-4*Margin-20, 3*Margin/2);
        [cancleBtn setTitle:@"发表评论" forState:UIControlStateNormal];
        [cancleBtn setTitleColor:Color_Hex16(@"666666") forState:UIControlStateNormal];
        cancleBtn.titleLabel.font = AppFont(text_size_other);
        cancleBtn.backgroundColor = View_BgColor;
        
        [viewS addSubview:cancleBtn];
        
    }
    return self;
}


-(void)changeImage:(UIButton *)sender
{

    
    if (sender.tag/100==0) {
 
            for (UIButton *button in self.viewS.subviews) {
                if (button.tag<sender.tag) {
                    button.selected = YES;
                
            }
        }
    }


}


- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self.overlayView];
    [keywindow addSubview:self];
    
    [self fadeIn];
}

- (void)dismiss
{
    [self fadeOut];
}

//弹入层
- (void)fadeIn
{
    //    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        //        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
}

//弹出层
- (void)fadeOut
{
    [UIView animateWithDuration:.35 animations:^{
        //        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}
@end
