//
//  TCCategoryController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCCategoryController.h"
#import "ChannelView.h"
#import "TCJPCollectionController.h"

#define CellMargin 10
#define EdgeMargin 5
#define CellIdentifier @"Cell"
#define CELLH 44

@interface TCCategoryController () <UITableViewDataSource ,UITableViewDelegate , UICollectionViewDataSource,UICollectionViewDelegate>

/** channel的图片名和title */
@property (nonatomic ,strong) NSArray *btnImages;
@property (nonatomic ,strong) NSArray *names;
@property (nonatomic ,strong) NSArray *btnImages2;
@property (nonatomic ,strong) NSArray *names1;
@property (nonatomic ,strong) NSArray *names2;
@property (nonatomic ,strong) NSArray *names3;
@property (nonatomic ,strong) NSArray *names4;
@property (nonatomic ,strong) NSArray *names5;
@property (nonatomic ,strong) NSArray *names6;
@property (nonatomic ,strong) NSArray *names7;
@property (nonatomic ,strong) NSArray *names8;
@property (nonatomic ,strong) NSArray *namesArray;
@property (nonatomic ,strong) UITableView *mytable;
@property (nonatomic ,strong) UIButton  *btn;
@property (nonatomic ,strong) NSArray *titles;
/** collection商品描述 */
@property (nonatomic ,strong) NSArray *collectionTitles;
@property (nonatomic ,strong) NSArray *cellTexts;
@property (nonatomic ,strong) ChannelView *channelView;
@property (nonatomic ,strong) UITableViewCell *cell;
@property (nonatomic ,assign) NSInteger index;
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) UILabel *label;
@property (nonatomic ,strong) UILabel *selectedLabel;
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
- (NSArray *)names1{
    if (!_names1) {
        _names1 = [NSArray arrayWithObjects:@"客厅",@"卧室",@"厨房",@"书房", nil];
    }
    return _names1;
}

- (NSArray *)names2{
    if (!_names2) {
        _names2 = [NSArray arrayWithObjects:@"家居",@"装饰",@"车库",@"烧烤场", nil];
    }
    return _names2;
}

- (NSArray *)names3{
    if (!_names3) {
        _names3 = [NSArray arrayWithObjects:@"客厅",@"卧室",@"厨房",@"书房",@"球场",@"泳池",@"卫生间",@"操场", nil];
    }
    return _names3;
}

- (NSArray *)names4{
    if (!_names4) {
        _names4 = [NSArray arrayWithObjects:@"垃圾桶",@"康师傅",@"农夫山泉",@"恒大冰泉",@"统一", nil];
    }
    return _names4;
}

- (NSArray *)names5{
    if (!_names5) {
        _names5 = [NSArray arrayWithObjects:@"耐克",@"阿迪达斯",@"优衣库",@"新百伦",@"鳄鱼",@"贵族", nil];
    }
    return _names5;
}

- (NSArray *)names6{
    if (!_names6) {
        _names6 = [NSArray arrayWithObjects:@"平民",@"地主",@"裁判",@"考官",@"傻逼",@"二笔",@"牛逼",@"丹顶鹤", nil];
    }
    return _names6;
}

- (NSArray *)names7{
    if (!_names7) {
        _names7 = [NSArray arrayWithObjects:@"动物",@"人类",@"畜生",@"小鬼",@"僵尸",@"魂魄", nil];
    }
    return _names7;
}

- (NSArray *)names8{
    if (!_names8) {
        _names8 = [NSArray arrayWithObjects:@"哈哈",@"嘿嘿",@"嘻嘻",@"哄哄", nil];
    }
    return _names8;
}

- (NSArray *)namesArray{
    if (!_namesArray){
        _namesArray = [[NSArray alloc]initWithObjects:self.names1,self.names2,self.names3,self.names4,self.names5,self.names6,self.names7,self.names8, nil];
    }
    return _namesArray;
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

- (NSArray *)collectionTitles{
    if (!_collectionTitles){
        _collectionTitles = [[NSArray alloc]initWithObjects:@"[可可佳]简约现代书柜书架置物架简易柜子书柜实木柜",@"[SWEETNIGHT]进口乳胶床垫1.5  1.8米弹簧椰棕颜色齐全",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用",@"[可可佳]简约现代书柜书架置物架简易柜子书柜实木柜",@"[SWEETNIGHT]进口乳胶床垫1.5  1.8米弹簧椰棕颜色齐全",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用",@"[可可佳]简约现代书柜书架置物架简易柜子书柜实木柜",@"[SWEETNIGHT]进口乳胶床垫1.5  1.8米弹簧椰棕颜色齐全",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用", nil];
    }
    return _collectionTitles;
}

- (UILabel *)label{
    if (!_label){
        _label = [[UILabel alloc]init];
    }
    return _label;
}

- (UILabel *)selectedLabel{
    if (!_selectedLabel){
        _selectedLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
        _selectedLabel.backgroundColor = Color(230, 230, 230);
        _selectedLabel.text = @"沙发";
        _selectedLabel.textAlignment = NSTextAlignmentCenter;
        _selectedLabel.textColor = [UIColor orangeColor];
    }
    return _selectedLabel;
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

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(101, 0, JPScreenW - self.mytable.width, JPScreenH - 64 - 46) collectionViewLayout:layout];
        
        layout.itemSize = CGSizeMake(_collectionView.width  / 3    , (_collectionView.width ) / 3);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        
        NSLog(@"%@",NSStringFromCGRect(_collectionView.frame));
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
    }return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 1, JPScreenH)];
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    // 注册cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.collectionView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mytable addSubview:self.selectedLabel];
    [self.view addSubview:self.mytable];
    [self.mytable selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.names.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, cell.width, cell.height  -  20)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",rand()%15]];
    [cell.contentView addSubview:imageView];
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, imageView.height, cell.width, cell.height - imageView.height);
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = RandomColor;
    label.text = self.names[indexPath.item];
    label.font = [UIFont systemFontOfSize:14];
    [cell.contentView addSubview:label];
    self.label = label;

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TCJPCollectionController *collectionVc = [[TCJPCollectionController alloc]init];
    collectionVc.titles = self.collectionTitles;
    [self.navigationController pushViewController:collectionVc  animated:YES];
}



#pragma mark - tableDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellTexts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:cell.contentView.bounds];
    label.text = self.cellTexts[indexPath.row];
//    label.backgroundColor = RandomColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    [cell setValue:label forKeyPath:@"textLabel"];
//    [cell.contentView addSubview:label];
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, CELLH - 1, cell.contentView.width, 1)];
    line.backgroundColor = [UIColor grayColor];
    [cell.contentView addSubview:line];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
//    cell.contentView.backgroundColor = [UIColor clearColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.names = self.namesArray[indexPath.row];
    self.selectedLabel.text = self.cellTexts[indexPath.row];
        [UIView animateWithDuration:0.4 animations:^{
        self.selectedLabel.y = self.selectedLabel.height * indexPath.row;
    }completion:^(BOOL finished) {
        

    }];
    [UIView animateWithDuration:0.5 animations:^{
        [self.collectionView reloadData];
    }completion:^(BOOL finished) {
        [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLH;
}



@end
