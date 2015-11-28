//
//  TCNavigationController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCNavigationController.h"
#import "UIBarButtonItem+Extension.h"
@interface TCNavigationController ()

@end

@implementation TCNavigationController

+ (void)initialize{

//    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    
    
    /**设置导航栏主题*/
    [self setupNavigationBarTheme];

    [self setupNavigationItem];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    
    
}

+(void)setupNavigationItem{
    
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    
}

+(void)setupNavigationBarTheme{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    //    设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [appearance setTitleTextAttributes:textAttrs];
    
}







/**
 * 能拦截所有的自控制器。如果现在push的不是栈底控制器(最先push进来的那个控制器)
 */



/**全局推出的导航的navigationItem*/

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
  
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithBg:@"注册-1_03" title:@"返回" target:self action:@selector(back)];
    }
    
    [super pushViewController:viewController animated:YES];
    
    
}


-(void)back
{
    
    [self popViewControllerAnimated:YES];
    
}


@end
