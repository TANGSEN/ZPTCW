//
//  TreasureView.m
//  天巢网
//
//  Created by 赵贺 on 15/12/15.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TreasureView.h"

@implementation TreasureView
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGPoint center = self.center;
    CGRect frame = self.frame;
    center.x = self.frame.size.width/2;
    center.y = self.frame.size.height/2/2;
    self.TopLabel = [[UILabel alloc] init];
    self.TopLabel.width = frame.size.width;
    self.TopLabel.height = frame.size.height/2;
    self.TopLabel.center = center;
    self.TopLabel.textAlignment = NSTextAlignmentCenter;
    self.TopLabel.textColor = [UIColor blackColor];
    self.TopLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:self.TopLabel];
    
    self.BottomLabel = [[UILabel alloc] init];
    self.BottomLabel.width = frame.size.width;;
    self.BottomLabel.height = frame.size.height/2;
    self.BottomLabel.centerX = self.frame.size.width/2;
    self.BottomLabel.centerY = self.frame.size.height/2+self.frame.size.height/2/2;
    self.BottomLabel.textColor = [UIColor blackColor];
    self.BottomLabel.font = [UIFont systemFontOfSize:11];
    self.BottomLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.BottomLabel];
}

//-(void)drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    self.backgroundColor  = [UIColor whiteColor];
//    CGPoint center = self.center;
//    CGRect frame = rect;
//    center.x = rect.size.width/2;
//    center.y = rect.size.height/2/2;
//    self.TopLabel.width = frame.size.width;
//    self.TopLabel.height = frame.size.height/2;
//    self.TopLabel.center = center;
//    self.TopLabel.textAlignment = NSTextAlignmentCenter;
//    self.TopLabel.textColor = [UIColor blackColor];
//    self.TopLabel.font = [UIFont systemFontOfSize:11];
//    [self addSubview:self.TopLabel];
//    
//    
//    self.BottomLabel.width = frame.size.width;;
//    self.BottomLabel.height = frame.size.height/2;
//    self.BottomLabel.centerX = self.frame.size.width/2;
//    self.BottomLabel.centerY = self.frame.size.height/2+self.frame.size.height/2/2;
//    self.BottomLabel.textColor = [UIColor blackColor];
//    self.BottomLabel.font = [UIFont systemFontOfSize:11];
//    self.BottomLabel.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:self.BottomLabel];
//}
@end
