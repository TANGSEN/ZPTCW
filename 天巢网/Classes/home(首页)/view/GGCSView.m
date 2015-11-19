//
//  GGCSView.m
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "GGCSView.h"

@implementation GGCSView

+ (GGCSView *)view{
    
    GGCSView *view = [[GGCSView alloc]init];
    view.backgroundColor = RandomColor;
    return view;
}
+ (CGFloat)height{
    return 300;
}
@end
