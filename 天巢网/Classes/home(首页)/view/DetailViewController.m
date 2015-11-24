//
//  DetailView.m
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailScrollView.h"
#import "DetailDescriptionView.h"

@interface DetailViewController () <UIScrollViewDelegate>
@property (nonatomic ,weak) DetailScrollView *scrollView;
@property (nonatomic ,strong) NSArray *images;
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic ,strong) DetailDescriptionView *descriptionView;
@end

static CGFloat _height;

@implementation DetailViewController

- (NSArray *)images{
    if (!_images){
        _images = [[NSArray alloc]initWithObjects:@"1",@"2",/*@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",*/ nil];
    }
    return _images;
}

- (void)viewDidLoad{
        [self setupScrollView];
        [self setupDescriptionView];
        [self setupPageControl];

}
         
- (void)setupScrollView{
    DetailScrollView *scrollView = [DetailScrollView scrollViewWithImages:self.images];
    scrollView.images = self.images;
    scrollView.delegate = self;
    scrollView.width = JPScreenW;
    scrollView.height = 200;
    scrollView.x = 0;
    scrollView.y = 0;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)setupDescriptionView{
    DetailDescriptionView *descriptionView = [DetailDescriptionView descriptionView];
    descriptionView.x = 0;
    descriptionView.y = CGRectGetMaxY(self.scrollView.frame);
    descriptionView.width = JPScreenW;
    descriptionView.height = [DetailDescriptionView height];
    [self.view addSubview:descriptionView];
    _height = CGRectGetMaxY(descriptionView.frame);
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    // 1.添加
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    NSInteger count = self.images.count;
    pageControl.numberOfPages = count;
    pageControl.centerX = self.view.width * 0.5;
    pageControl.centerY = self.scrollView.height - 10;
    [self.view addSubview:pageControl];
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = Color(253, 98, 42); // 当前页的小圆点颜色
    pageControl.pageIndicatorTintColor = Color(189, 189, 189); // 非当前页的小圆点颜色
    self.pageControl = pageControl;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获得页码
    CGFloat doublePage = scrollView.contentOffset.x / scrollView.width;
    int intPage = (int)(doublePage + 0.5);
    
    // 设置页码
    self.pageControl.currentPage = intPage;
}

+ (CGFloat)height{
    return _height;
}


@end
