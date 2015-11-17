//
//  DeteilScrollView.m
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "DetailScrollView.h"

@interface DetailScrollView ()
@end

@implementation DetailScrollView

+ (DetailScrollView *)scrollViewWithImages:(NSArray *)images {
    DetailScrollView *scrollView = [[self alloc]init];
    scrollView.width = JPScreenW;
    scrollView.height = 200;
    scrollView.x = 0;
    scrollView.y = 0;
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    NSInteger count = images.count;
    for (int i = 0; i < count; i ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *imageName = images[i];
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
        
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i * imageW;
    }
    scrollView.contentSize = CGSizeMake(count * imageW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = Color(246, 246, 246);
    return scrollView;
}

@end
