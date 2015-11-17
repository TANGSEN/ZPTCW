//
//  UIBarButtonItem+Extension.m
//  微博
//
//  Created by This is GeGe iMac on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Extnesion.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建一个 item
 *  
 *  @param target    点击 item 后调用哪个对象的方法
 *  @param action    点击 item 调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的 item
 */

+ (UIBarButtonItem *)itemWithTarget:(id)target Action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    
    // 设置按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    
    
    
    
    
    
    
    
    
}
@end
