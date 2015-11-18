//
//  ProfileViewCell.m
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "ProfileViewCell.h"

@implementation ProfileViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
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
