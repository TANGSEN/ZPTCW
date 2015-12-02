//
//  Utils.h
//  天巢网
//
//  Created by 赵贺 on 15/11/30.
//  Copyright © 2015年 tangjp. All rights reserved.

//工具--正则表达式

#import <Foundation/Foundation.h>

@interface Utils : NSObject
/**正则匹配用户手机号码*/
+ (BOOL)checkTelNumber:(NSString *)telNumber;
/**验证密码6-18位*/
+ (BOOL)checkPassword:(NSString *)passWord;
@end
