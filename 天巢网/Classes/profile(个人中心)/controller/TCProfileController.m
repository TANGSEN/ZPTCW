//
//  TCProfileController.m
//  天巢网
//
//  Created by tangjp on 15/11/10.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCProfileController.h"
#import "ProfileViewCell.h"
#import "TCOrderManagerController.h"
#import "TCWealthListController.h"
#import "FeedbackViewController.h"
#import "MyFavoriteViewController.h"
#import "TCNavigationController.h"
#import "InformationManagerController.h"
#import "MyShoppingController.h"

@interface TCProfileController ()
/**分区文字*/
@property (nonatomic,strong)NSArray *sectionsTitles;
/**分区图片*/
@property (nonatomic,strong)NSArray *sectionsImages;
@end

@implementation TCProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = View_BgColor;
    
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
}


-(NSArray *)sectionsImages
{
    if (!_sectionsImages) {
        _sectionsImages = @[@"1-个人中心_03",@"1-个人中心_07",@"1-个人中心_11",@"1-个人中心_15",@"1-个人中心_19",@"1-个人中心_23"];
    }
    return _sectionsImages;

}


-(NSArray *)sectionsTitles
{
    if (!_sectionsTitles) {
        _sectionsTitles = @[@"订单管理",@"财富流水",@"我的购物车",@"我的收藏",@"信息管理",@"投诉建议"];
    }
    return _sectionsTitles;

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.sectionsImages count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    ProfileViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell  = [[[NSBundle mainBundle] loadNibNamed:@"ProfileViewCell" owner:self options:nil] lastObject];
    }
    cell.CellLabel.text = self.sectionsTitles[indexPath.section];
    
    cell.CellLabel.font = AppFont(text_size_little_2);
    cell.CellLabel.textColor = Color_Common;
    cell.ImageView.image = [UIImage imageNamed:self.sectionsImages[indexPath.section]];
    cell.ImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return 20.0f;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 55.0f;

}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *obj = nil;
    
    switch (indexPath.section) {
        case 0:
            obj = [[TCOrderManagerController alloc] init];
            break;
        case 1:
            obj = [[TCWealthListController alloc] init];
            break;
        case 2:
            obj = [[MyShoppingController alloc] initWithNibName:@"MyShoppingController" bundle:nil];
//            obj = [[MyShoppingController alloc] init];
            break;
        case 3:
            obj = [[MyFavoriteViewController alloc] init];
            break;
        case 4:
            obj = [[InformationManagerController alloc] init];
            break;
        case 5:
            obj = [[FeedbackViewController alloc] init];
            break;
        default:
            break;
    }
   
    obj.title = self.sectionsTitles[indexPath.section];
    obj.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:obj animated:YES];
    NSLog(@"%@",self.sectionsTitles[indexPath.section]);

}


@end
