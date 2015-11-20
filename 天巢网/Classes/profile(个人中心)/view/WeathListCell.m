//
//  WeathListCell.m
//  天巢网
//
//  Created by 赵贺 on 15/11/19.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "WeathListCell.h"

@implementation WeathListCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
