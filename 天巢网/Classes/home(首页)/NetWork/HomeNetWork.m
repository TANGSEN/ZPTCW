//
//  HomeNetWork.m
//  天巢网
//
//  Created by tangjp on 15/11/26.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "HomeNetWork.h"

#define kAdvertisementPath @"http://10.0.0.3:8080/zp/frontapi/rotatePics"

@implementation HomeNetWork

+ (id)getAdcertisementWithBlock:(void (^)(id, NSError *))completionHandle{
    NSDictionary *params = [NSDictionary dictionary];
    return [self GET:kAdvertisementPath parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([AdvertisementModel mj_objectArrayWithKeyValuesArray:responseObj],error);
    }];
}

@end
