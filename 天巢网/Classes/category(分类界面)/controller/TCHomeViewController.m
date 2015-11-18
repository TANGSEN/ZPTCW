//
//  TCHomeViewController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCHomeViewController.h"
#import "RXCollectionController.h"
#import "ChannelView.h"
#import "LoadMoreFooter.h"
#import "Channel.h"
@import AVFoundation;

#define CellIdentifier @"Cell"
#define MaxSections 20

@interface TCHomeViewController () <UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>
@property (nonatomic ,weak) UISearchBar *searchBar;
@property (nonatomic ,strong) NSTimer *timer;
@property (nonatomic ,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) UICollectionView *rxCollectionView;
@property (nonatomic ,strong) NSArray *images;
@property (nonatomic ,strong) UIPageControl *pageControl;
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) ChannelView *channelView;
@property (nonatomic ,strong) RXCollectionController *collectionVC;
@property (nonatomic ,strong) LoadMoreFooter *footer;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *visableArray;
@property (nonatomic, strong) NSMutableArray *filterArray;
@property (nonatomic, strong) NSMutableArray *dataSourceArray;
@property (nonatomic, strong) UISearchController *mySearchController;

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



- (NSArray *)images{
    if (!_images) {
        _images = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15", nil];
        
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
 *  添加上拉加载更多控件
 */
- (void)setupRefresh{
    
    LoadMoreFooter *footer = [LoadMoreFooter footer];
    footer.frame = CGRectMake(0, CGRectGetMaxY(self.rxCollectionView.frame), JPScreenW, 40);
    [self.scrollView addSubview:footer];
    self.footer = footer;
    _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(footer.frame));
}

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
    CGRect rect = CGRectMake(0, CGRectGetMaxY(self.pageControl.frame), JPScreenW, 150);
    ChannelView *channelView = [[ChannelView alloc]initWithFrame:rect];
    for (Channel *channel in channelView.subviews) {
        UIButton *btn = channel.subviews[0];
        [btn bk_addEventHandler:^(id sender) {
            NSLog(@"点击了频道分类按钮");
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        } forControlEvents:UIControlEventTouchUpInside];
    }
    [self.scrollView addSubview:channelView];
    self.channelView = channelView;
}

- (void)btnClick{
    NSLog(@"channel");
}


- (void)addCollectionView{
    self.collectionVC = [[RXCollectionController alloc]init];
    [self addChildViewController:self.collectionVC];
    UICollectionView *collectionView = self.collectionVC.collectionView;
//    collectionView.userInteractionEnabled = NO;
    collectionView.frame = CGRectMake(0, CGRectGetMaxY(self.channelView.frame) + 20, JPScreenW, [RXCollectionController height]);
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:collectionView];
    self.rxCollectionView = collectionView;
    
    _scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.rxCollectionView.frame));}




/**
 *  设置导航栏右边的按钮
 */
- (void)setupRightBarBtn{
    UIButton *btn = [[UIButton alloc]init];
    [btn setTitle:@"广州" forState:UIControlStateNormal];
    /**
     *  导航栏右边按钮点击事件
     */
    [btn bk_addEventHandler:^(id sender) {
        NSLog(@"点击了导航栏右边的按钮");
    } forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIButton *imageBtn = [[UIButton alloc]init];
    [imageBtn setImage:[UIImage imageNamed:@"首页-1_09"] forState:UIControlStateNormal];
    imageBtn.frame = CGRectMake(35, 0, 15, 20);
    btn.frame = CGRectMake(0, 0, 35, 20);
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, 50, 20);
    [view addSubview:btn];
    [view addSubview:imageBtn];
    [imageBtn bk_addEventHandler:^(id sender) {
        NSLog(@"点击了导航栏右边的按钮");
    } forControlEvents:UIControlEventTouchUpInside];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -10;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItems = @[spaceItem,item];
}

- (void)setupLeftBarBtn{
    NSString *image = @"首页-1_03";
    /**
     *  设置导航栏左边的按钮
     *
     *  @param NSString 图片名称
     */
    [Factory addMenuItemToVC:self withTarget:self image:(NSString *)image selectImage:(NSString *)image andAction:@selector(leftBarBtnClick)];
}

/**
 *  导航栏左边按钮点击事件
 */
- (void)leftBarBtnClick{
    NSLog(@"点击了导航栏左边的按钮");
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
//    NSString *imageName = [NSString stringWithFormat:@"cm2_daily_banner%ld",indexPath.item + 1];
    NSString *imageName = self.images[indexPath.item];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
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
