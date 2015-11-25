//
//  RXCollectionCell.h
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCJPCollectionCell : UICollectionViewCell
@property (nonatomic ,assign) NSInteger price;
@property (nonatomic ,assign) NSInteger sales;
@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *imageName;
@end
