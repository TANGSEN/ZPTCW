//
//  TCStoryCell.m
//  天巢网
//
//  Created by tangjp on 15/11/20.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCStoryCell.h"
#import "TCStoryModel.h"

@interface TCStoryCell ()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIButton *distance;
@property (weak, nonatomic) IBOutlet UILabel *line;

@end

@implementation TCStoryCell

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
//    if (self) {
//        self.name.text = self.model.storyName;
//        self.address.text = self.model.storyAddress;
//        self.phone.text = self.model.storyPhone;
//    }
//    return self;
//}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"music";
    TCStoryCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TCStoryCell" owner:self options:nil] lastObject];
        
    }
    
    return cell;
}

- (void)setModel:(TCStoryModel *)model
{
    _model = model;
    
    self.name.text = model.StoryName;
    self.address.text = model.StoryAddress;
    self.phone.text = model.StoryPhone;
    self.line.backgroundColor = Color(229, 229, 229);
    self.name.textColor = Color(100, 100, 100);
    self.address.textColor = Color(100, 100, 100);
    self.phone.textColor = Color(100, 100, 100);
    [self.distance setTitleColor:Color(100, 100, 100) forState:UIControlStateNormal];
    [self.distance setTintColor:Color(100, 100, 100)];;
    
}

@end
