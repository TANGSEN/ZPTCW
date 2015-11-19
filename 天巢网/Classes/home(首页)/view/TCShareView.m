//
//  TCShareView.m
//  天巢网
//
//  Created by tangjp on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCShareView.h"
#import "Channel.h"

/**  列数 */
#define JPBtnMaxCount 3
/** 自身的高度 */
#define SelfH 185

#define BtnW (JPScreenW - (JPBtnMaxCount) * BtnMargin) / JPBtnMaxCount

#define BtnH BtnW
#define BtnY 80

#define BtnMargin (JPScreenW - 55 * JPBtnMaxCount) / JPBtnMaxCount

@interface TCShareView ()

@property (nonatomic ,strong) NSArray *btnImages;
@end

static Channel *_channel;

@implementation TCShareView

// 按钮的图片
- (NSArray *)btnImages{
    if (!_btnImages) {
        _btnImages = [NSArray arrayWithObjects:@"share_qq",@"share_wechat",@"share_pengyouquan", nil];
    }return _btnImages;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        UIButton *btn = [[UIButton alloc]init];
        btn.tag = 1;
        btn.Width = 15;
        btn.Height = 15;
        btn.y = 10;
        btn.x = JPScreenW - btn.Width - 10;
        [btn setImage:[UIImage imageNamed:@"share_btn_cancel"] forState:UIControlStateNormal];
        [btn bk_addEventHandler:^(id sender) {
            [UIView animateWithDuration:0.25 animations:^{
                self.y = JPScreenH;
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        for (int i = 0; i < self.btnImages.count; i++) {
            Channel *channel = [Channel channelViewinitWithBtnRect:CGRectMake(0, 0, 55, 55)];
            channel.btnImageName = self.btnImages[i];
            channel.labelText = @"朋友圈";
            [self addSubview:channel];
        }
    }
    return self;
}







- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (int i = 0; i<count; i++) {
        // 行号
        Channel *channel = self.subviews[i];
        if (channel.tag == 1) {
            continue;
        }
        ;
        channel.x = (i - 1) * (BtnMargin + BtnW) + BtnMargin / 2;
        channel.y = BtnY;
        channel.width = BtnW;
        channel.height = BtnH;
        _channel = channel;
    }
}

+ (CGFloat)height{
    return SelfH;
}

@end
