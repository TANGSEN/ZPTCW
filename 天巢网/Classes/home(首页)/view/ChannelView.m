//
//  ChannelView.m
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "ChannelView.h"
#import "Channel.h"
// 列数
#define JPBtnMaxCols 4
// 行数
#define JPBtnMaxRows 2
// 间距
#define JPChannelMargin 10

@interface ChannelView ()

@property (nonatomic ,strong) UIButton *btn;
@property (nonatomic ,strong) NSArray *btnImages;
@property (nonatomic ,strong) NSArray *names;
@property (nonatomic ,strong) Channel *channel;

@end

@implementation ChannelView

- (NSArray *)names{
    if (!_names) {
        _names = [NSArray arrayWithObjects:@"客厅",@"卧室",@"厨房",@"书房",@"阳台",@"卫浴",@"办公室",@"儿童房", nil];
    }
    return _names;
}

// 按钮的图片
- (NSArray *)btnImages{
    if (!_btnImages) {
        _btnImages = [NSArray arrayWithObjects:@"首页-1_15",@"首页-1_17",@"首页-1_19",@"首页-1_21",@"首页-1_28",@"首页-1_29",@"首页-1_30",@"首页-1_27", nil];
    }return _btnImages;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger count = self.btnImages.count;
        // 添加所有子控件
        for (int i = 0; i<count; i++) {
            Channel *channel = [[Channel alloc]init];
            channel.btnImageName = self.btnImages[i];
            channel.labelText = self.names[i];
            [self addSubview:channel];
            self.channel = channel;
        }
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    NSInteger count = self.btnImages.count;
    CGFloat btnW = (self.width - 5 * JPChannelMargin) / JPBtnMaxCols;
    CGFloat btnH = (self.height - 2 * JPChannelMargin) / JPBtnMaxRows;
    for (int i = 0; i<count; i++) {
        // 行号
        int row = i / JPBtnMaxCols;
        // 列号
        int col = i % JPBtnMaxCols;
        Channel *channel = self.subviews[i];
            channel.x = col * (JPChannelMargin + btnW) + JPChannelMargin;
            channel.y = row * (JPChannelMargin + btnH) + JPChannelMargin;
            channel.width = btnW;
            channel.height = btnH;
        self.channel = channel;
        
    }
    
}

@end
