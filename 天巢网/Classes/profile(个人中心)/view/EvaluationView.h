//
//  EvaluationView.h
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationView : UIView
@property (nonatomic, strong) NSString *content;//标题
@property (nonatomic, strong) UIControl *overlayView;
@property (nonatomic, strong) NSString *message;//内容
@property (nonatomic, strong) NSString *pictureName;//图片名称
@property (nonatomic, strong) NSString *shareUrl;//跳转URL

-(void)show;
-(void)dismiss;
@end
