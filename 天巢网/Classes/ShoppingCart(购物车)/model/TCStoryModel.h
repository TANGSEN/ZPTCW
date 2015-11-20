//
//  TCStoryModel.h
//  天巢网
//
//  Created by tangjp on 15/11/20.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCStoryModel : NSObject

/** 门店电话 */
@property (nonatomic ,copy) NSString *StoryPhone;
/** 门店地址 */
@property (nonatomic ,copy) NSString *StoryAddress;
/** 门店名称 */
@property (nonatomic ,copy) NSString *StoryName;
// 返回所有的门店
+ (NSArray *)storys;
@end
