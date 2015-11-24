//
//  TRTextView.m
//  微博
//
//  Created by 赵贺 on 15/7/13.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TCTextView.h"
@interface TCTextView()

@property(weak,nonatomic) UILabel *placeholderLabel;


@end
@implementation TCTextView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *placeholderLabel = [[UILabel alloc] init];
        [self addSubview:placeholderLabel];
    
        
        self.layer.borderWidth = 0.4f;
        self.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3].CGColor;
        
        self.placeholderLabel = placeholderLabel;
        
        self.font = AppFont(text_size_middle_3);
        self.placeholderLabel.textColor = [UIColor lightGrayColor];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
        
        
    }
    return self;

}



-(void)textDidChange
{
    
    self.placeholderLabel.hidden = self.text.length;
    
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    self.placeholderLabel.text = placeholder;

}
-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    self.placeholderLabel.font = font;
    
    //    重新计算子控件的frame
    [self setNeedsDisplay];


}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.placeholderLabel.y = 10;
    self.placeholderLabel.x = 8;
    self.placeholderLabel.width = self.width - 2*self.placeholderLabel.x;
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[NSFontAttributeName] = self.font;
    CGSize titleSize = [self.placeholder sizeWithAttributes:params];
    self.placeholderLabel.height = titleSize.height;
    

}


@end
