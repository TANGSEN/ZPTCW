//
//  RXCollectionCell.m
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "RXCollectionCell.h"

@interface RXCollectionCell ()
@property (nonatomic ,weak) UIImageView *imageView;
@property (nonatomic ,weak) UIButton *btn;
@property (nonatomic ,weak) UILabel *priceLabel;
@property (nonatomic ,weak) UILabel *salesLabel;

@end

@implementation RXCollectionCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        self.imageView = imageView;
        
        UIButton *btn = [[UIButton alloc]init];
        btn.titleLabel.numberOfLines = 2;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:btn];
        self.btn = btn;
        
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor redColor];
        priceLabel.font = [UIFont boldSystemFontOfSize:12];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UILabel *salesLabel = [[UILabel alloc]init];
        salesLabel.textColor = [UIColor grayColor];
        _salesLabel.textAlignment = NSTextAlignmentCenter;
        salesLabel.font = [UIFont boldSystemFontOfSize:12];
        [self addSubview:salesLabel];
        self.salesLabel = salesLabel;
    }
    return self;
}


- (void)setImageName:(NSString *)imageName{
    _imageName = [imageName copy];
    _imageView.image = [UIImage imageNamed:_imageName];
}

- (void)setTitle:(NSString *)title{
    _title = [title copy];
    [_btn setTitle:_title forState:UIControlStateNormal];
}

- (void)setPrice:(NSInteger)price{
    _price = price;
    _priceLabel.text = [NSString stringWithFormat:@"$%ld",_price];

}

- (void)setSales:(NSInteger)sales{
    _sales = sales;
    _salesLabel.text = [NSString stringWithFormat:@"已售%ld",_sales];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = CGRectMake(0, 0, self.width, 100);
    _btn.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame) + 5, self.width, 40);
    _priceLabel.frame = CGRectMake(0, self.height - 20, self.width / 2, 20);
    _salesLabel.frame = CGRectMake(self.width / 2, self.height - 20, self.width / 2, 20);

}


@end
