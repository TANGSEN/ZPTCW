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
#import <TencentOpenAPI/TencentOAuth.h>
#import <SMS_SDK/SMSSDK.h>
#import "Pingpp.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    TCTabBarController *tctabbar = [[TCTabBarController alloc]init];
    self.window.rootViewController = tctabbar;
    
    [ShareSDK registerApp:ShareAppKey];
    
 
    
    //添加微信应用 注册网址 http://open.weixin.qq.com
    [ShareSDK connectWeChatWithAppId:WXAppID
                           appSecret:WXAppSecret
                           wechatCls:[WXApi class]];
    
    //微信朋友圈
    [ShareSDK connectWeChatTimelineWithAppId:WXAppID appSecret:WXAppSecret wechatCls:[WXApi class]];
    
    //QQ
    [ShareSDK connectQQWithAppId:QQAppID qqApiCls:[QQApiInterface class]];
    
    //短信验证

    
    
    
    [SMSSDK registerApp:SMSAppKey withSecret:SMSAppSecret];
    
    [Pingpp enableBtn:PingppBtnWx];
    
    [self.window makeKeyAndVisible];

    return YES;
    
    
    
}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
                        wxDelegate:self];
}

//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation
//{
//    return [ShareSDK handleOpenURL:url
//                 sourceApplication:sourceApplication
//                        annotation:annotation
//                        wxDelegate:self];
//}




- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL canHandleURL = [Pingpp handleOpenURL:url withCompletion:nil];
    return canHandleURL;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
    BOOL canHandleURL = [Pingpp handleOpenURL:url withCompletion:nil];
    return canHandleURL;
}

@end
