//
//  TCCategoryController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCCategoryController.h"

@interface TCCategoryController ()
@property (nonatomic ,strong) UIWebView *webView;
@end

@implementation TCCategoryController

- (UIWebView *)webView{
    if (!_webView){
        _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, -55, JPScreenW, JPScreenH + 60)];
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.skyhives.com/m/category"]]];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RandomColor;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 分类url http://www.skyhives.com/m/category
    
    
    
    self.webView.scrollView.bounces = NO;
    self.webView.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.webView];
}



@end
