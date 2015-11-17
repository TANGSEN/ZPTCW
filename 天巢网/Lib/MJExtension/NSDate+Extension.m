//
//  NSDate+Extension.m
//  微博
//
//  Created by This is GeGe iMac on 15/7/3.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear{
    // 日历对象 (方便比较两个日期之间的差距)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday{
    
    NSDate *now = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *yesterdayDateStr = [fmt stringFromDate:self];
    
    NSString *todayDateStr = [fmt stringFromDate:now];
    NSDate *date = [fmt dateFromString:yesterdayDateStr];
    
    now = [fmt dateFromString:todayDateStr];
    
    // 日历对象 (方便比较两个日期之间的差距)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // NSCalendarUnit枚举代表想获得那些差值
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitWeekOfMonth | NSCalendarUnitDay;
    
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
    
}


/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *yesterdayDateStr = [fmt stringFromDate:self];
    
    NSString *todayDateStr = [fmt stringFromDate:now];
    return [yesterdayDateStr isEqualToString:todayDateStr];
}



@end
