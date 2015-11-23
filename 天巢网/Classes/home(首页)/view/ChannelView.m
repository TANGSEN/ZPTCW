//
//  ChannelView.m
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "ChannelView.h"
#import "Channel.h"
/**  列数 */
#define JPBtnMaxCols 4
/**  行数 */
#define JPBtnMaxRows 2
/** 间距 */
#define JPChannelMargin 10
/** 自身的高度 */
#define SelfH 180;

#define JPBtnCount 8

@interface ChannelView ()

@property (nonatomic ,strong) UIButton *btn;
@property (nonatomic ,strong) Channel *channel;

@end

static ChannelView *_channelView = nil;

@implementation ChannelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
    }
    return self;
}



/**
 *  返回一个频道视图
 *
 *  @param btnImages 频道的图片
 *  @param names     频道的名字
 *  @param rect      频道视图的位置
 *
 *  @return 频道视图
 */
+ (ChannelView *)channelViewWithRect:(CGRect)rect {
    _channelView = [[self alloc]initWithFrame:rect];
    
    return _channelView;
}


- (void)setChannelImages:(NSArray *)channelImages{
    _channelImages = channelImages;
    Channel *channel = nil;
    for (int i = 0; i < self.cols * self.rows; i++) {
       channel  = [Channel channelViewinitWithBtnRect:CGRectMake(0, 0, 40, 40)];
        channel.btnImageName = channelImages[i];
        channel.labelText = self.channelNames[i];
        [_channelView addSubview:channel];
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnMargin = (self.width - 40 * self.cols) / self.cols;
    CGFloat btnW = (self.width - 4 * btnMargin) / self.cols;
    CGFloat btnH = (self.height - JPChannelMargin) / self.rows;
    NSInteger count = self.cols * self.rows;
    for (int i = 0; i < count; i++) {
        // 行号
        int row = i / self.cols;
        // 列号
        int col = i % self.cols;
        Channel *channel = _channelView.subviews[i];
            channel.x = col * (btnMargin + btnW) + btnMargin / 2;
            channel.y = row * btnH + JPChannelMargin;
            channel.width = btnW;
            channel.height = btnH;
        self.channel = channel;
    }
}

+ (CGFloat)height{
    return SelfH;
}

@end
