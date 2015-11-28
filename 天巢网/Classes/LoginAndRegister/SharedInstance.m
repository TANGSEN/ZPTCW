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

+(SharedInstance *)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!shared)
            shared = [[SharedInstance alloc]init];
    });
    
    return shared;
}
@end
