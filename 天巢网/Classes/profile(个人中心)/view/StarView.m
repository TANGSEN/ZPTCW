//
//  StarView.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "StarView.h"

#define Margin (int)(ApplicationframeValue.width-20)/14
@interface StarView ()

@property (nonatomic, strong) UIView *starBackgroundView;
@property (nonatomic, strong) UIView *starForegroundView;

@end
@implementation StarView

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.starBackgroundView = [self buidlStarViewWithImageName:@"5-我的订单-评价_07"];
        self.starForegroundView = [self buidlStarViewWithImageName:@"5-我的订单-评价_03"];
        [self addSubview:self.starBackgroundView];
        
        self.userInteractionEnabled = YES;
        /**点击手势*/
        UITapGestureRecognizer *tapGR=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
        [self addGestureRecognizer:tapGR];
        
        /**滑动手势*/
        
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
        [self addGestureRecognizer:panGR];
        
    }
    return self;
    
}



- (UIView *)buidlStarViewWithImageName:(NSString *)imageName
{
    CGRect frame = self.bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(frame.origin.x+4*Margin, frame.origin.y, ApplicationframeValue.width-20, Margin)];
    view.clipsToBounds = YES;
    for (int i = 0; i < 5; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(2*i*Margin, 0, Margin, Margin);
        [view addSubview:imageView];
    }
    return view;
}

-(void)tapGR:(UITapGestureRecognizer *)tapGR{
    CGPoint point =[tapGR locationInView:self];
    int WidthX = point.x - 4*Margin;
    NSLog(@"点击的x%d",WidthX);
    if (WidthX<0) {
        WidthX = -2*Margin;
    }
    int ww =(int) ((WidthX+2*Margin)/(2*Margin));
    

    
    NSLog(@"ww:%d,widthX%d",ww,WidthX);
    self.starForegroundView.frame = CGRectMake(4*Margin, 0, ww*2*Margin, Margin);
    [self addSubview:self.starForegroundView];
    
    
}



@end
