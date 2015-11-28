//
//  UIBarButtonItem+Extension.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)barButtonItemWithBg:(NSString *)bg title:(NSString *)title target:(id)target action:(SEL)action
{
    
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    UIButton *imageBtn = [[UIButton alloc]init];
    [imageBtn setImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
    imageBtn.frame = CGRectMake(-3, 0, 10, 20);
    btn.frame = CGRectMake(9, 0, 35, 20);
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 60, 20);
    
    [view addSubview:imageBtn];
    [view addSubview:btn];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [imageBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}
@end
