//
//  UIBarButtonItem+Extension.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)barButtonItemWithBg:(NSString *)bg title:(NSString *)title size:(CGSize)size target:(id)target action:(SEL)action
{
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 按钮文字
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:text_size_other];
    [btn setTitleColor:nil forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:bg] forState:UIControlStateHighlighted];
    // 按钮边框
    btn.bounds =  (CGRect){CGPointZero, size};
    // 监听器
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
