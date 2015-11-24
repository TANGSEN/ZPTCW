//
//  EvaluationView.m
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "EvaluationView.h"
#import "StarView.h"


/**间距*/
#define Margin (int)(ApplicationframeValue.width-20)/14


@interface EvaluationView  ()
/**空的星星视图*/
@property (nonatomic,strong)UIView *EmptyView;
/**实心的星星*/
@property (nonatomic,strong)UIView *StarView;


@end

@implementation EvaluationView



-(id)initWithFrame:(CGRect)frame
{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        self.overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
        [self.overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        
        /**显示视图*/
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
        /**左边儿文字*/
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
            }else{
                /**五角星视图*/
                StarView *starView = [[StarView alloc] initWithFrame:CGRectMake(0, 70+2*Margin*i, ApplicationframeValue.width-20, Margin)];
                [viewS addSubview:starView];
               
            }
            
        }

        /**发表评论视图*/
        UIButton *EvaluationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        EvaluationBtn.frame = CGRectMake(2*Margin, self.frame.size.height-60, ApplicationframeValue.width-4*Margin-20, 3*Margin/2);
        [EvaluationBtn setTitle:@"发表评论" forState:UIControlStateNormal];
        [EvaluationBtn setTitleColor:Color_Hex16(@"666666") forState:UIControlStateNormal];
        EvaluationBtn.titleLabel.font = AppFont(text_size_other);
        EvaluationBtn.backgroundColor = View_BgColor;
        
        [viewS addSubview:EvaluationBtn];
        
    }
    return self;
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
