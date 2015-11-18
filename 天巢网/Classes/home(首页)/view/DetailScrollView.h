//
//  DeteilScrollView.h
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//  商品详情的商品滚动视图

#import <UIKit/UIKit.h>

@interface DetailScrollView : UIScrollView
+ (DetailScrollView *)scrollViewWithImages:(NSArray *)images;
@property (nonatomic ,strong) NSArray *images;
@end
