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
        _btnImages = [NSArray arrayWithObjects:@"button_keting",@"button_woshi",@"button_chufan",@"button_shufan",@"button_yangtai",@"button_weiyu",@"button_bangongshi",@"button_ertongfang", nil];
    }return _btnImages;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加所有子控件
        for (int i = 0; i<JPBtnCount; i++) {
            Channel *channel = [Channel channelViewinitWithBtnRect:CGRectMake(0, 0, 40, 40)];
            
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
    CGFloat btnMargin = (JPScreenW - 40 * JPBtnMaxCols) / JPBtnMaxCols;
    CGFloat btnW = (JPScreenW - 4 * btnMargin) / JPBtnMaxCols;
    CGFloat btnH = (self.height - JPChannelMargin) / JPBtnMaxRows;
    for (int i = 0; i < JPBtnCount; i++) {
        // 行号
        int row = i / JPBtnMaxCols;
        // 列号
        int col = i % JPBtnMaxCols;
        Channel *channel = self.subviews[i];
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
