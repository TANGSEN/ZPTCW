//
//  ChannelView.h
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelView : UIView
+ (CGFloat)height;
+ (ChannelView *)channelViewWithRect:(CGRect)rect;
@property (nonatomic ,assign) NSInteger cols;
@property (nonatomic ,assign) NSInteger rows;
@property (nonatomic ,strong) NSArray *channelImages;
@property (nonatomic ,strong) NSArray *channelNames;
@end
