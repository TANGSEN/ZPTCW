//
//  EvaluationView.m
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "EvaluationView.h"

@implementation EvaluationView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
        [self.overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *viewS = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width-40, ApplicationframeValue.height-150)];
        viewS.backgroundColor = Color_Hex16(@"eaeaea");
        [self addSubview:viewS];
        
        
        
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 90, 100, 15)];
        label.text = @"分享到";
        label.textColor = Color_Hex16(@"6d6d6d");
        label.backgroundColor = [UIColor clearColor];
        label.font = AppFont(12);
        [viewS addSubview:label];
        
        
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleBtn.frame = CGRectMake(0, 160 -44, ApplicationframeValue.width-40, 44);
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancleBtn setTitleColor:Color_Hex16(@"666666") forState:UIControlStateNormal];
        cancleBtn.titleLabel.font = AppFont(14);
        cancleBtn.backgroundColor = [UIColor whiteColor];
        
        [viewS addSubview:cancleBtn];
        
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
