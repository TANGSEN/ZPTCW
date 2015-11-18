//
//  TCDetailTableController.m
//  天巢网
//
//  Created by tangjp on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//  商品详情

#import "TCDetailTableController.h"
#import "DetailViewController.h"
#import "CustomerView.h"
#import "GGCSView.h"
#import "TWXQView.h"


@interface TCDetailTableController () <CustomerDelegate>
@property (nonatomic ,strong) CustomerView *topView;
/** 图文详情视图 */
@property (nonatomic ,strong) TWXQView *twxqView;
/** 规格参数视图 */
@property (nonatomic ,strong) GGCSView *ggcsView;
/** 滚动图加标题的视图 */
@property (nonatomic ,strong) DetailViewController *detailView;

@property (nonatomic ,strong) NSIndexPath *indexpath;

@property (nonatomic ,weak) UITableViewCell *cell;
@end

@implementation TCDetailTableController

- (TWXQView *)twxqView{
    if (!_twxqView){
        _twxqView = [TWXQView view];
        _twxqView.frame = CGRectMake(0, 0, JPScreenW, [TWXQView height]);
    }
    return _twxqView;
}

- (DetailViewController *)detailView{
    if (!_detailView){
//        _detailView = [[DetailView alloc]initWithFrame:CGRectMake(0, 0, JPScreenW, [DetailView height])];
        _detailView = [[DetailViewController alloc]init];
    }
    return _detailView;
}

- (GGCSView *)ggcsView{
    if (!_ggcsView) {
        _ggcsView = [GGCSView view];
        _ggcsView.frame = CGRectMake(0, 0, JPScreenW, [GGCSView height]);
        _ggcsView.hidden = YES;
    }return _ggcsView;
}

- (CustomerView *)topView{
    if (!_topView){
        _topView = [[CustomerView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.size.width, 47) initButWithArray:[NSArray arrayWithObjects:@"商品详情",@"规格参数",nil] butFont:(NSInteger)14];
        _topView.delegate = self;
        _topView.clipsToBounds = YES;
    }
    
    return _topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.tableView.userInteractionEnabled = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.bounces = NO;
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    NSLog(@"%@",NSStringFromCGRect(self.tableView.frame));
    self.tableView.frame = CGRectMake(0, 20, 320, 300);
}




#pragma mark - CustomerDelegate
-(void)OnclickCustomerTag:(NSInteger)customerTag
{
    if (customerTag == self.topView.currentIndex) {
        return;
    }
    
    NSLog(@"%ld",(long)customerTag);
    
    switch (customerTag) {
        case 1:
            self.twxqView.hidden = NO;
            self.ggcsView.hidden = YES;
            [self.tableView reloadRowsAtIndexPaths:@[self.indexpath] withRowAnimation:UITableViewRowAnimationAutomatic];
            NSLog(@"商品详情");
            break;
        case 2:
            self.twxqView.hidden = YES;
            self.ggcsView.hidden = NO;
            [self.tableView reloadRowsAtIndexPaths:@[self.indexpath] withRowAnimation:UITableViewRowAnimationAutomatic];
            NSLog(@"规格参数");
        default:
            break;
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    cell.textLabel.text = nil;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = YES;
    if (indexPath.section == 0) {
        self.detailView.view.frame = CGRectMake(0, 0, JPScreenW, [DetailViewController height]);
        [cell.contentView addSubview:self.detailView.view];
        cell.contentView.userInteractionEnabled = YES;
    }else if (indexPath.section == 3){
        [cell.contentView addSubview:self.topView];
    }else if (indexPath.section == 4){
        self.indexpath = indexPath;
        [cell.contentView addSubview:self.twxqView];
        [cell.contentView addSubview:self.ggcsView];
    }else if (indexPath.section == 5){
        UIButton *phoneBtn = [[UIButton alloc]init];
        phoneBtn.x = 0;
        phoneBtn.height = 50;
        phoneBtn.width = JPScreenW / 2;
        phoneBtn.y = 0;
        [phoneBtn setTitle:@"电话" forState:UIControlStateNormal];
        phoneBtn.backgroundColor = RandomColor;
        
        UIButton *gouBtn = [[UIButton alloc]init];
        gouBtn.backgroundColor = RandomColor;
        [gouBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        gouBtn.frame = phoneBtn.frame;
        gouBtn.x = JPScreenW / 2;
        [cell.contentView addSubview:phoneBtn];
        [cell.contentView addSubview:gouBtn];
    }else {
        NSArray *array = [[NSArray alloc]initWithObjects:@"类型\\规格\\颜色",@"附近出售该商品的商家",@"", nil];
        cell.textLabel.text = array[indexPath.section - 1];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [DetailViewController height];
    }
    if (indexPath.section == 3) {
        return 47;
    }
    if (indexPath.section == 4) {
        if (self.ggcsView.hidden == YES) {
            return [TWXQView height];
        }else{
            return [GGCSView height];
        }
    }
    if (indexPath.section == 5) {
        return 50;
    }
    return 44;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    if (section == 4) {
        return 0;
    }
    if (section == 5) {
        return 0;
    }
    return 20;
}



@end
