//
//  UIView+Extension.m
//  UIViewExtension
//
//  Created by 赵贺 on 15/9/30.
//  Copyright © 2015年 ulic. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}
-(CGFloat)X
{
    return self.frame.origin.x;
}


-(void)setY:(CGFloat)Y
{
    CGRect frame =  self.frame;
    frame.origin.y = Y;
    self.frame = frame;

}
-(CGFloat)Y
{
    return self.frame.origin.y;
}


-(void)setWidth:(CGFloat)Width
{
    CGRect frame = self.frame;
    frame.size.width = Width;
    self.frame = frame;
}
-(CGFloat)Width
{
    return self.frame.size.width;
}


-(void)setHeight:(CGFloat)Height
{

    CGRect frame = self.frame;
    frame.size.height = Height;
    self.frame = frame;

}
-(CGFloat)Height
{
    return self.frame.size.height;
}


-(void)setSize:(CGSize)Size
{
    CGRect frame = self.frame;
    frame.size = Size;
    self.frame = frame;
}
-(CGSize)Size
{
    return self.frame.size;
}


-(void)setOrigin:(CGPoint)Origin
{
    CGRect frame = self.frame;
    frame.origin = Origin;
    self.frame = frame;
}
-(CGPoint)Origin
{
    return self.frame.origin;
}

-(void)setCenterX:(CGFloat)CenterX
{
    CGPoint center = self.center;
    center.x = CenterX;
    self.center = center;
}
-(CGFloat)CenterX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)CenterY
{
    CGPoint center = self.center;
    center.y = CenterY;
    self.center = center;
}

-(CGFloat)CenterY
{
    return self.center.y;
}
@end













