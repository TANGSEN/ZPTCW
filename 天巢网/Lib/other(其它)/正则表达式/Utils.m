//
//  Utils.m
//  天巢网
//
//  Created by 赵贺 on 15/11/30.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "Utils.h"

@implementation Utils

#pragma 正则匹配用户手机号码

+ (BOOL)checkTelNumber:(NSString *)telNumber
{
    NSString *regex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}
#pragma 正则匹配用户密码
+ (BOOL)checkPassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    BOOL isMatch =[passWordPredicate evaluateWithObject:passWord];
    return isMatch;
}

@end
