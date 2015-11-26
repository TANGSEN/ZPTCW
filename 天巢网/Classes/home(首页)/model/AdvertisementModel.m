//
//  AdvertisementModel.m
//  天巢网
//
//  Created by tangjp on 15/11/26.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "AdvertisementModel.h"

@implementation AdvertisementModel



- (void)setThumb:(NSString *)thumb{
    _thumb = thumb;
    _thumb = [NSString stringWithFormat:@"%@%@",@"img.k980.com",_thumb];
}

@end




