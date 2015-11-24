//
//  EvaluationView.h
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.


//立即评价视图

#import <UIKit/UIKit.h>

@interface EvaluationView : UIView


@property (nonatomic, strong) UIControl *overlayView;

@property(nonatomic,strong)UIView *viewS;
-(void)show;
-(void)dismiss;

@end
