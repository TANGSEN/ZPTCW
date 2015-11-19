//
//  TWXQView.m
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TWXQView.h"

@implementation TWXQView

+ (TWXQView *)view{
    
    TWXQView *view = [[TWXQView alloc]init];
    view.backgroundColor = RandomColor;
    return view;
}
+ (CGFloat)height{
    return 500;
}
@end
