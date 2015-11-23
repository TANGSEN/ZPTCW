//
//  InformationManagerController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/23.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "InformationManagerController.h"
#import "PhoneBindingController.h"
#import "EmailBindingController.h"
@interface InformationManagerController ()
@property(nonatomic,strong)NSMutableArray *titles;
@end

@implementation InformationManagerController



-(void)viewDidLoad
{

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, 0)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

-(NSMutableArray *)titles
{
    if (!_titles) {
        _titles = [NSMutableArray arrayWithObjects:@"名称",@"手机绑定",@"邮箱绑定", nil];
    }
    return _titles;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        
    }
    cell.textLabel.text  = self.titles[indexPath.section];
    cell.textLabel.textColor = Color_Common;
    cell.textLabel.font = AppFont(text_size_middle_3);
    cell.detailTextLabel.text = self.titles[indexPath.section];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.detailTextLabel.font = AppFont(text_size_little_2);
    return cell;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *obj = nil;
    obj.view.backgroundColor = [UIColor whiteColor];
    switch (indexPath.section) {
        case 0:
            return;
        case 1:
            obj = [[PhoneBindingController alloc] init];
            break;
        case 2:
            obj = [[EmailBindingController alloc] init];
            break;
    }
    obj.title = self.titles[indexPath.section];
    [self.navigationController pushViewController:obj animated:YES];



}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
    
}
@end
