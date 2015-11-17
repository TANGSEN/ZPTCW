//
//  Channel.m
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "Channel.h"


#define JPChannelFont 10

@interface Channel ()

@property (nonatomic ,strong) UIButton *btn;
@property (nonatomic ,strong) UILabel *label;

@end


@implementation Channel

- (UIButton *)btn{
    if (!_btn){
        _btn = [[UIButton alloc]init];
    }
    return _btn;
}

- (UILabel *)label{
    if (!_label){
        _label = [[UILabel alloc]init];
    }
    return _label;
}

- (void)setBtnImageName:(NSString *)btnImageName{
    _btnImageName = btnImageName;
    [self.btn setImage:[UIImage imageNamed:btnImageName] forState:UIControlStateNormal];
}

- (void)setLabelText:(NSString *)labelText{
    _labelText = labelText;
    self.label.text = labelText;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(btn.frame) + 10, btn.width, 20)];
        label.font = [UIFont boldSystemFontOfSize:JPChannelFont];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:btn];
        [self addSubview:label];
        self.btn = btn;
        self.label = label;
    }
    return self;
}

@end
