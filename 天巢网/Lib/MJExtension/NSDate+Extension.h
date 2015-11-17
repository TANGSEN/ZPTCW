//
//  NSDate+Extension.h
//  微博
//
//  Created by This is GeGe iMac on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;


/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;

@end
