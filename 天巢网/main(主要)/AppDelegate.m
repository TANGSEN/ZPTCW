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
    
    
    
 
   /**社会化分享*/
    [ShareSDK registerApp:ShareAppKey];
    
        //1.添加微信应用
        [ShareSDK connectWeChatWithAppId:WXAppID
                           appSecret:WXAppSecret
                           wechatCls:[WXApi class]];
    
        //2.微信朋友圈
        [ShareSDK connectWeChatTimelineWithAppId:WXAppID appSecret:WXAppSecret wechatCls:[WXApi class]];
    
        //3.QQ
        [ShareSDK connectQQWithAppId:QQAppID qqApiCls:[QQApiInterface class]];
    
    
    /**短信验证*/
    
        [SMSSDK registerApp:SMSAppKey withSecret:SMSAppSecret];
    
    /**ping++ 加入微信和支付宝支付*/
    
        [Pingpp enableBtn:PingppBtnWx|PingppBtnAlipay];
    
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

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    BOOL canHandleURL = [Pingpp handleOpenURL:url withCompletion:nil];
    return canHandleURL;
}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL canHandleURL = [Pingpp handleOpenURL:url withCompletion:nil];
    BOOL ShareSdkURL = [ShareSDK handleOpenURL:url
                             sourceApplication:sourceApplication
                                    annotation:annotation
                                    wxDelegate:self];
    
    return canHandleURL||ShareSdkURL;
}



@end
