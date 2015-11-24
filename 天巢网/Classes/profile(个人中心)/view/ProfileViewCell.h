//
//  ProfileViewCell.h
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.


//个人中心 --自定义单元格

#import <UIKit/UIKit.h>

@interface ProfileViewCell : UITableViewCell
/**左边图片*/
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
/**文字*/
@property (strong, nonatomic) IBOutlet UILabel *CellLabel;


@end
