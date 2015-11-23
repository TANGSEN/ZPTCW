//
//  ShareView.h
//  天巢网
//
//  Created by 赵贺 on 15/11/20.
//  Copyright © 2015年 tangjp. All rights reserved.
//分享视图

#import <UIKit/UIKit.h>

@interface ShareView : UIView
@property (nonatomic, strong) NSString *content;//标题
/**蒙版*/
@property (nonatomic, strong) UIControl *overlayView;
@property (nonatomic, strong) NSString *message;//内容
@property (nonatomic, strong) NSString *pictureName;//图片名称
@property (nonatomic, strong) NSString *shareUrl;//跳转URL
@property(nonatomic,strong)UIView *viewS;
-(void)show;
-(void)dismiss;
@end
