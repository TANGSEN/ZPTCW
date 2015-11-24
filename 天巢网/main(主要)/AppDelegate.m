//
//  AppDelegate.m
//  天巢网
//
//  Created by tangjp on 15/11/11.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "AppDelegate.h"
#import "TCTabBarController.h"


#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import <QQConnection/QQConnection.h>
#import <TencentOpenAPI/QQApiInterface.h>

@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    TCTabBarController *tctabbar = [[TCTabBarController alloc]init];
    self.window.rootViewController = tctabbar;
    [self.window makeKeyAndVisible];
    
    [ShareSDK registerApp:ShareAppKey];
    
    
    
    //添加微信应用 注册网址 http://open.weixin.qq.com
    [ShareSDK connectWeChatWithAppId:WXAppID
                           appSecret:WXAppSecret
                           wechatCls:[WXApi class]];
    
    //微信朋友圈
    [ShareSDK connectWeChatTimelineWithAppId:WXAppID appSecret:WXAppSecret wechatCls:[WXApi class]];
    
    //QQ
    //    [ShareSDK connectQQWithAppId:QQAppID qqApiCls:[QQApiInterface class]];
//    [ShareSDK connectQQWithQZoneAppKey:QQAppPKEY qqApiInterfaceCls:[QQApiInterface class] tencentOAuthCls:[TencentOAuth class]];
    [ShareSDK connectQQWithAppId:QQAppID qqApiCls:[QQApiInterface class]];
    
    
    
    
    
    
    
    
//    [ShareSDK connectQQWithQZoneAppKey:QQAppPKEY
    
     
//                     qqApiInterfaceCls:[QQApiInterface class]
    
     
//                       tencentOAuthCls:[TencentOAuth class]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
