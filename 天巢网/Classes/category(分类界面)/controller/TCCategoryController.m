//
//  TCCategoryController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCCategoryController.h"
#import "ChannelView.h"

@interface TCCategoryController () <UITableViewDataSource ,UITableViewDelegate>

/** channel的图片名和title */
@property (nonatomic ,strong) NSArray *btnImages;
@property (nonatomic ,strong) NSArray *names;
@property (nonatomic ,strong) NSArray *btnImages2;
@property (nonatomic ,strong) NSArray *names2;
@property (nonatomic ,strong) UITableView *mytable;
@property (nonatomic ,strong) UIButton  *btn;
@property (nonatomic ,strong) NSArray *titles;
@property (nonatomic ,strong) NSArray *cellTexts;
@property (nonatomic ,strong) ChannelView *channelView;
@property (nonatomic ,strong) UITableViewCell *cell;
@property (nonatomic ,assign) NSInteger index;
@end

@implementation TCCategoryController

#pragma mark - 懒加载

// channel按钮的图片
- (NSArray *)btnImages{
    if (!_btnImages) {
        _btnImages = [NSArray arrayWithObjects:@"button_yangtai",@"button_weiyu",@"button_bangongshi",@"button_ertongfang", nil];
    }return _btnImages;
}
// channel按钮的title
- (NSArray *)names{
    if (!_names) {
        _names = [NSArray arrayWithObjects:@"阳台",@"卫浴",@"办公室",@"儿童房", nil];
    }
    return _names;
}
- (NSArray *)btnImages2{
    if (!_btnImages2) {
        _btnImages2 = [NSArray arrayWithObjects:@"button_keting",@"button_woshi",@"button_chufan",@"button_shufan", nil];
    }return _btnImages2;
}
// channel按钮的title
- (NSArray *)names2{
    if (!_names2) {
        _names2 = [NSArray arrayWithObjects:@"客厅",@"卧室",@"厨房",@"书房", nil];
    }
    return _names2;
}


- (NSArray *)cellTexts{
    if (!_cellTexts){
        _cellTexts = [[NSArray alloc]initWithObjects:@"沙发",@"客厅",@"卧室",@"餐厅",@"儿童房",@"精品",@"软装",@"闪购", nil];
    }
    return _cellTexts;
}

- (NSArray *)titles{
    if (!_titles){
        _titles = [[NSArray alloc]initWithObjects:@"这是一段测试数据",@"为了监听点击cell",@"看看会不会改变按钮上得内容",@"谢谢大家观赏",@"这是一段测试数据",@"为了监听点击cell",@"看看会不会改变按钮上得内容",@"谢谢大家观赏",@"看看会不会改变按钮上得内容",@"谢谢大家观赏", nil];
    }
    return _titles;
}

- (UITableView *)mytable{
    if (!_mytable) {
        _mytable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, JPScreenH  -64)];
        _mytable.dataSource = self;
        _mytable.delegate = self;
        _mytable.backgroundColor = Color(240, 240, 240);
        _mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mytable.bounces  = NO;
        _mytable.showsVerticalScrollIndicator = NO;
    }
    return _mytable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.mytable.x = 0;
//    self.mytable.y = 64;
//    self.mytable.width = 100;
//    self.mytable.height = JPScreenH;
    [self.view addSubview:self.mytable];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 1, JPScreenH)];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(101, 150, 220, 150)];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setTitle:@"沙发" forState:UIControlStateNormal];
    self.btn = btn;
}






- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellTexts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = [UIColor blackColor];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 99, cell.contentView.width, 1)];
    line.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:line];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.cellTexts[indexPath.row];
    if (self.cell != nil && self.index == indexPath.row) {
        cell.textLabel.textColor = RandomColor;
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.index = indexPath.row;
    self.cell = cell;
   
    
    [self.btn setTitle:self.titles[indexPath.row] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.5 animations:^{
    [tableView reloadData];
    }completion:^(BOOL finished) {
         
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



@end
