//
//  ImageTitleButton.m
//  天巢网
//
//  Created by 赵贺 on 15/12/15.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "ImageTitleButton.h"

@implementation ImageTitleButton
-(void)layoutSubviews
{
    // Center image
    [super layoutSubviews];
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2+5;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    
}
@end
