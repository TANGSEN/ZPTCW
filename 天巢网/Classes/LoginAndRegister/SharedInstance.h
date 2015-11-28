//
//  SharedInstance.h
//  天巢网
//
//  Created by 赵贺 on 15/11/27.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SharedInstance : NSObject
+(SharedInstance *)sharedInstance;
//**标记用户是否已经登陆
@property (nonatomic,assign)  BOOL alreadyLanded;

@end
