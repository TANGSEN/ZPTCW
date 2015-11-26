//
//  AdvertisementModel.h
//  天巢网
//
//  Created by tangjp on 15/11/26.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AdvertisementModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *Description;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger add_time;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *four_li;

@property (nonatomic, copy) NSString *py;

@property (nonatomic, copy) NSString *is_foreign;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, copy) NSString *update_time;

@property (nonatomic, copy) NSString *content;

@end

