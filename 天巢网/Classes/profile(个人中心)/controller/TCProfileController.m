//
//  TCProfileController.m
//  个人中心
//
//  Created by 赵贺 on 15/12/15.
//  Copyright © 2015年 赵贺. All rights reserved.
//

#import "TCProfileController.h"
#import "TCProfileTable.h"
@interface TCProfileController ()
@property (nonatomic,strong)TCProfileTable *ProfileTable;
@end

@implementation TCProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.ProfileTable = [[TCProfileTable alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height-200-49) style:UITableViewStylePlain];
    [self.view addSubview:self.ProfileTable];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
