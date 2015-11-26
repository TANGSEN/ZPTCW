//
//  HomeNetWork.h
//  天巢网
//
//  Created by tangjp on 15/11/26.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "JPNetWork.h"
#import "AdvertisementModel.h"

@interface HomeNetWork : JPNetWork

+ (id)getAdcertisementWithBlock:kCompletionHandle;
@end
