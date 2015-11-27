//
//  TCHomeViewController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCHomeViewController.h"
#import "TCJPCollectionController.h"
#import "ChannelView.h"
#import "LoadMoreFooter.h"
#import "Channel.h"
#import "TLCityPickerController.h"
#import "HomeNetWork.h"
#import "AdvertisementModel.h"

@import AVFoundation;

#define CellIdentifier @"Cell"
#define MaxSections 20

@interface TCHomeViewController () <UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,TLCityPickerDelegate,UIActionSheetDelegate>
@property (nonatomic ,weak) UISearchBar *searchBar;
@property (nonatomic ,strong) NSTimer *timer;
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) UICollectionView *rxCollectionView;
@property (nonatomic ,strong) NSArray *images;
/** channel的图片名和title */
@property (nonatomic ,strong) NSArray *btnImages;
@property (nonatomic ,strong) NSArray *names;
/** collectionViewcontrollerItemTitles */
@property (nonatomic ,strong) NSArray *titles;
@property (nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) ChannelView *channelView;
@property (nonatomic ,strong) TCJPCollectionController *collectionVC;
@property (nonatomic ,strong) LoadMoreFooter *footer;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *visableArray;
@property (nonatomic, strong) NSMutableArray *filterArray;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) UISearchController *mySearchController;
@property (nonatomic ,weak) UIView *rxHeader;
@property (nonatomic ,weak) UIButton *headerBtn;

@property (nonatomic ,weak) UIButton *cityPickerButton;

@end

@implementation TCHomeViewController

#pragma mark - UISearchController搜索功能
/**
 *  添加搜索框到导航栏上
 */
- (void)initial{
    self.dataSourceArray = [NSMutableArray array];
    self.filterArray = [NSMutableArray array];
    for (int i = 0; i < 26; i++) {
        for (int j = 0; j < 4; j++) {
            NSString *str = [NSString stringWithFormat:@"%c%d", 'A'+i, j];
            [self.dataSourceArray addObject:str];
        }
    }
    [self.dataSourceArray addObject:@"唐建平"];
    [self.dataSourceArray addObject:@"陈小冠"];
    self.visableArray = self.dataSourceArray;
    
    self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    self.mySearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _mySearchController.searchResultsUpdater = self;
    _mySearchController.dimsBackgroundDuringPresentation = NO;
    [_mySearchController.searchBar sizeToFit];
    self.mySearchController.hidesNavigationBarDuringPresentation = NO;
    self.mySearchController.searchBar.placeholder = @"请输入你想要搜索的商品名称";
    self.mySearchController.searchBar.delegate = self;
    self.searchBar = self.mySearchController.searchBar;
    self.mySearchController.searchBar.layer.cornerRadius = 5;
    self.navigationItem.titleView = self.mySearchController.searchBar;
    
    [self setupRightBarBtn];
    self.navigationItem.titleView = self.mySearchController.searchBar;
    _myTableView.hidden = YES;
    [self.view addSubview:_myTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_visableArray || _visableArray.count == 0) {
        _visableArray = _dataSourceArray;
    }
    return _visableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
    }
    cell.textLabel.text = nil;
    if (self.filterArray.count > 0) {
        cell.textLabel.text = [self.filterArray objectAtIndex:indexPath.row];
    }
    
    
    return cell;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *filterString = searchController.searchBar.text;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains [c] %@", filterString];
    
    self.visableArray = [NSMutableArray arrayWithArray:[self.dataSourceArray filteredArrayUsingPredicate:predicate]];
    self.filterArray = [NSMutableArray arrayWithArray:[self.dataSourceArray filteredArrayUsingPredicate:predicate]];
    
    [self.myTableView reloadData];
}

#pragma mark - 懒加载

- (NSArray *)titles{
    if (!_titles){
        _titles = [[NSArray alloc]initWithObjects:@"[可可佳]简约现代书柜书架置物架简易柜子书柜实木柜",@"[SWEETNIGHT]进口乳胶床垫1.5  1.8米弹簧椰棕颜色齐全",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用",@"[可可佳]简约现代书柜书架置物架简易柜子书柜实木柜",@"[SWEETNIGHT]进口乳胶床垫1.5  1.8米弹簧椰棕颜色齐全",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用",@"[可可佳]简约现代书柜书架置物架简易柜子书柜实木柜",@"[SWEETNIGHT]进口乳胶床垫1.5  1.8米弹簧椰棕颜色齐全",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用",@"[比尼贝尔]真皮沙发现代简约头层牛皮大小户型统统适用", nil];
    }
    return _titles;
}

// channel按钮的图片
- (NSArray *)btnImages{
    if (!_btnImages) {
        _btnImages = [NSArray arrayWithObjects:@"button_keting",@"button_woshi",@"button_chufan",@"button_shufan",@"button_yangtai",@"button_weiyu",@"button_bangongshi",@"button_ertongfang", nil];
    }return _btnImages;
}
// channel按钮的title
- (NSArray *)names{
    if (!_names) {
        _names = [NSArray arrayWithObjects:@"客厅",@"卧室",@"厨房",@"书房",@"阳台",@"卫浴",@"办公室",@"儿童房", nil];
    }
    return _names;
}


- (NSArray *)images{
    if (!_images) {
        _images = [NSArray arrayWithObjects:@"1",@"2",/*@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",*/ nil];
    }return _images;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(JPScreenW, JPScreenH / 3);
        layout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, JPScreenW, 150) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
    }return _collectionView;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, -64, JPScreenW, JPScreenH)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = Color(240, 240, 240);
    }return _scrollView;
}

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupLeftBarBtn];
    [self.view addSubview:self.scrollView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.collectionView];
    [self addPageControl];
    [self addChannelView];
    [self addRXHeaderView];
    [self addCollectionView];
    // 注册cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    // 默认显示最中间的那组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:MaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    // 添加定时器
    [self addTimer];
    [self initial];
    
    
}



/**
 *  屏幕点击方法
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.searchBar.isFirstResponder) {
        [self.searchBar resignFirstResponder];
        [self.searchBar setShowsCancelButton:NO animated:YES];
        [self setupRightBarBtn];
        [self setupLeftBarBtn];
        self.myTableView.hidden = YES;
    }else{
        NSLog(@"没有任何事件需要响应");
    }
    
}

#pragma mark - 自定义方法
/**
 *  添加pageControl
 */
- (void)addPageControl{
    self.pageControl = [[UIPageControl alloc]init];
    self.pageControl.numberOfPages = self.images.count;
    self.pageControl.y = self.collectionView.height - 20 + 64;
    self.pageControl.height = 20;
    self.pageControl.width = JPScreenW;
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.scrollView addSubview:self.pageControl];
}

/**
 *  添加频道分类
 */
- (void)addChannelView{
    CGRect rect = CGRectMake(0, CGRectGetMaxY(self.pageControl.frame), JPScreenW, [ChannelView height]);
//    ChannelView *channelView = [[ChannelView alloc]initWithFrame:rect];
    
    ChannelView *channelView = [ChannelView channelViewWithRect:rect];
    channelView.cols = 4;
    channelView.rows = 2;
    channelView.channelNames = self.names;
    channelView.channelImages = self.btnImages;
    channelView.backgroundColor = [UIColor whiteColor];
    for (Channel *channel in channelView.subviews) {
        UIButton *btn = channel.subviews[0];
        [btn bk_addEventHandler:^(id sender) {
            NSLog(@"点击了频道分类按钮");
            TCJPCollectionController *collectionVc = [[TCJPCollectionController alloc]init];
            collectionVc.titles = self.titles;
            [self.navigationController pushViewController:collectionVc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    [self.scrollView addSubview:channelView];
    self.channelView = channelView;
}

- (void)btnClick{
    NSLog(@"channel");
}

/**
 *  添加热销商品标题
 */
- (void)addRXHeaderView{
    UIView *rxHeader = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.channelView.frame) + JPMargin, JPScreenW, 50)];
    rxHeader.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, JPScreenW, 50)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"热销商品" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon-sanjiao"] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = 1;
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [btn setTitleColor:Color(95, 56, 37) forState:UIControlStateNormal];
    
    [self.scrollView addSubview:rxHeader];
    [rxHeader addSubview:btn];
    self.headerBtn = btn;
    self.rxHeader = rxHeader;
}

/**
 *  添加热销商品展示
 */
- (void)addCollectionView{
    self.collectionVC = [[TCJPCollectionController alloc]init];
    self.collectionVC.titles = self.titles;
    [self addChildViewController:self.collectionVC];
    UICollectionView *collectionView = self.collectionVC.collectionView;
//    collectionView.userInteractionEnabled = NO;
    collectionView.frame = CGRectMake(0, CGRectGetMaxY(self.rxHeader.frame), JPScreenW, [TCJPCollectionController height]);
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:collectionView];
    self.rxCollectionView = collectionView;
    
    _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.rxCollectionView.frame));}




/**
 *  设置导航栏右边的按钮
 */
- (void)setupRightBarBtn{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"广州市" forState:UIControlStateNormal];
    /**
     *  导航栏右边按钮点击事件
     */
    [btn bk_addEventHandler:^(id sender) {
        [self cityPickerButtonDown:sender];
    } forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIButton *imageBtn = [[UIButton alloc]init];
    [imageBtn setImage:[UIImage imageNamed:@"首页-1_09"] forState:UIControlStateNormal];
    imageBtn.frame = CGRectMake(50, 0, 15, 20);
    btn.frame = CGRectMake(-5, 0, 55, 20);
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 70, 20);
    [view addSubview:btn];
    [view addSubview:imageBtn];
    self.cityPickerButton = btn;
    [imageBtn bk_addEventHandler:^(id sender) {
        [self cityPickerButtonDown:sender];
    } forControlEvents:UIControlEventTouchUpInside];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItems = @[spaceItem,item];
}

- (void)cityPickerButtonDown:(UIButton *)sender {
    TLCityPickerController *cityPickerVC = [[TLCityPickerController alloc] init];
    [cityPickerVC setDelegate:self];
    
    cityPickerVC.locationCityID = @"1400010000";
    //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        
    }];
}

#pragma mark - TLCityPickerDelegate
- (void) cityPickerController:(TLCityPickerController *)cityPickerViewController didSelectCity:(TLCity *)city
{
    [self.cityPickerButton setTitle:city.cityName forState:UIControlStateNormal];
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(TLCityPickerController *)cityPickerViewController
{
    [cityPickerViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)setupLeftBarBtn{
    NSString *image = @"nav_logo";
    /**
     *  设置导航栏左边的按钮
     *
     *  @param NSString 图片名称
     */
    [Factory addMenuItemToVC:self withTarget:self image:(NSString *)image selectImage:(NSString *)image andAction:@selector(leftBarButtonItemClick)];
}


- (void)leftBarButtonItemClick{
    [HomeNetWork getAdcertisementWithBlock:^(NSMutableArray *array, NSError *error) {
                    for (AdvertisementModel *model in array) {
        
        
                        NSLog(@"thumb%@",model.thumb);
                    }
                }];
}




#pragma mark - UISearchBarDelegate
/**
 *  UISearchBar得到焦点并开始编辑时，执行该方法
 */
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:NO];
    self.navigationItem.rightBarButtonItems = nil;
    [UIView animateWithDuration:0.2 animations:^{
        self.navigationItem.leftBarButtonItems = nil;
        
    }];
    [self showSearchResultTableView];
    return YES;
}

/**
 *  取消按钮被按下时，执行的方法
 */
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    
    [self.searchBar resignFirstResponder];
    [self.searchBar setShowsCancelButton:NO animated:NO];
    [self hiddenSearchResultTableView];
    
    [self setupRightBarBtn];
    [UIView animateWithDuration:0.2 animations:^{
        
        [self setupLeftBarBtn];
    }];
    
}
/**
 *  键盘中，搜索按钮被按下，执行的方法
 */
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"---%@",searchBar.text);
    [self.searchBar resignFirstResponder];// 放弃第一响应者
    
}

/**
 *  当搜索内容变化时，执行该方法。很有用，可以实现时实搜索
 */
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;{
    NSLog(@"textDidChange---%@",searchBar.text);
}

/**
 *  隐藏搜索结果
 */
- (void)hiddenSearchResultTableView{
    [UIView animateWithDuration:0.3 animations:^{
        self.myTableView.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.myTableView.hidden = YES;
    }];
}

/**
 *  显示搜索结果
 */
- (void)showSearchResultTableView{
    
    [UIView animateWithDuration:0.1 animations:^{
        self.myTableView.hidden = NO;
    }];
    [UIView animateWithDuration:0.3 animations:^{
        self.myTableView.alpha = 1.0;
    }];
}

#pragma mark - 定时器方法
/**
 *  添加定时器
 */
- (void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    // 停止定时器
    [self.timer invalidate];
    self.timer = nil;
}

- (NSIndexPath *)resetIndexPath
{
    // 当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:MaxSections/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    return currentIndexPathReset;
}

/**
 *  下一页
 */
- (void)nextPage
{
    // 1.马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.images.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3.通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return MaxSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    __block NSMutableArray *models = [[NSMutableArray alloc]init];
    [HomeNetWork getAdcertisementWithBlock:^(NSArray *array, NSError *error) {
        for (AdvertisementModel *model in array) {
            
            [models addObject:model.thumb];
        }
    }];
    NSArray *arr = [[NSArray alloc]init];
    arr = models;
    NSString *imageName = self.images[indexPath.item];
  
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:imageName];
//    [imageView sd_setImageWithURL:[NSURL URLWithString:imageName]];
    imageView.frame = CGRectMake(0, 0 , JPScreenW, JPScreenH/3);
    [cell.contentView addSubview:imageView];
    
    return cell;
}

#pragma mark  - UICollectionViewDelegate
/**
 *  当用户即将开始拖拽的时候就调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  当用户停止拖拽的时候就调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5) % self.images.count;
    self.pageControl.currentPage = page;
}






@end
