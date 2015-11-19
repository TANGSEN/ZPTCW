//
//  GGCSView.m
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "GGCSView.h"

#define CellCount 8
#define CellHeight 50

@interface GGCSView () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSArray *names;
@property (nonatomic ,strong) NSArray *detailTexts;

@end

@implementation GGCSView

- (NSArray *)detailTexts{
    if (!_detailTexts){
        _detailTexts = [[NSArray alloc]initWithObjects:@"",@"凯撒豪庭",@"KSHT-KSH-HO23-TZ",@"美式古典",@"3件",@"7.93m",@"023系",@"广东佛山", nil];
    }
    return _detailTexts;
}

- (NSArray *)names{
    if (!_names){
        _names = [[NSArray alloc]initWithObjects:@"基本信息",@"品牌",@"型号",@"风格",@"包件",@"体积",@"色系",@"产地", nil];
    }
    return _names;
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.bounces = NO;
        self.backgroundColor = RandomColor;
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.rowHeight = 50;
    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return CellCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Identifier];
    }
    cell.textLabel.text = self.names[indexPath .row];
    cell.detailTextLabel.text = self.detailTexts[indexPath . row];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 49.5, JPScreenW, 0.5)];
    label.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:label];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeight;
}

+ (CGFloat)Height{
    return CellCount * CellHeight;
}
@end
