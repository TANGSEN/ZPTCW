//
//  Channel.h
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Channel : UIView

@property (nonatomic ,copy) NSString *btnImageName;
@property (nonatomic ,copy) NSString *labelText;
@property (nonatomic ,assign) CGRect rect;

+ (Channel *)channelViewinitWithBtnRect:(CGRect)rect;
@end
