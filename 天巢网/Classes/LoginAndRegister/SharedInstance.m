//
//  SharedInstance.m
//  天巢网
//
//  Created by 赵贺 on 15/11/27.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "SharedInstance.h"
static SharedInstance *shared = nil;
@implementation SharedInstance
/**单例*/
+(SharedInstance *)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!shared)
            shared = [[SharedInstance alloc]init];
    });
    
    return shared;
}



/**设置密码*/
-(void)setPassword:(NSString *)password{

    [[NSUserDefaults standardUserDefaults]setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults]synchronize];



}
/**获取密码*/
-(NSString *)getPassword{

    NSString *apppassword=[[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    return apppassword;

}
/**设置用户账号*/
-(void)setUserName:(NSString *)userName{

    [[NSUserDefaults standardUserDefaults]setObject:userName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]synchronize];


}
/**获取用户账号*/
-(NSString *)getUserName{


    NSString *username=[[NSUserDefaults standardUserDefaults]objectForKey:@"userName"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    return username;



}@end
