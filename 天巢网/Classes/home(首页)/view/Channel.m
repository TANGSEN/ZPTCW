//
//  Channel.m
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "Channel.h"


#define JPChannelFont 12

@interface Channel ()

//@property (nonatomic ,strong) UIButton *btn;
//@property (nonatomic ,strong) UILabel *label;

@end

static UIButton *_btn;
static UILabel *_label;

@implementation Channel

//- (UIButton *)btn{
//    if (!_btn){
//        _btn = [[UIButton alloc]init];
//    }
//    return _btn;
//}
//
//- (UILabel *)label{
//    if (!_label){
//        _label = [[UILabel alloc]init];
//    }
//    return _label;
//}

- (void)setBtnImageName:(NSString *)btnImageName{
    _btnImageName = btnImageName;
    [_btn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
}

- (void)setLabelText:(NSString *)labelText{
    _labelText = labelText;
    _label.text = labelText;
}

//- (instancetype)initWithFrame:(CGRect)frame{
//    if (self = [super initWithFrame:frame]) {
//        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(btn.frame) + 10, btn.width, 20)];
//        label.font = [UIFont boldSystemFontOfSize:JPChannelFont];
//        label.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:btn];
//        [self addSubview:label];
//        _btn = btn;
//        _label = label;
//    }
//    return self;
//}

+ (Channel *)channelViewinitWithBtnRect:(CGRect)rect{
    Channel *channel = [[Channel alloc]init];
    UIButton *btn = [[UIButton alloc]initWithFrame:rect];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame) + 10, btn.width, 20)];
    label.font = [UIFont boldSystemFontOfSize:JPChannelFont];
    label.textAlignment = NSTextAlignmentCenter;
    [channel addSubview:btn];
    [channel addSubview:label];
    _btn = btn;
    _label = label;
    return channel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}



@end
