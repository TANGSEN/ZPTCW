//
//  MyShoppingController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/24.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "MyShoppingController.h"
#import "TCShoppingTable.h"
#import "MyShoppingCell.h"
@interface MyShoppingController ()

@property (nonatomic,strong)TCShoppingTable *tableView;
@end

@implementation MyShoppingController
- (IBAction)ChooseAllBtn:(UIButton *)sender {
    for (UIButton *button in self.tableView.buttons) {
        button.selected = YES;
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[TCShoppingTable alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, ApplicationframeValue.height-64-70)];

    [self.view addSubview:self.tableView];
    
    NSMutableArray *presum = [[NSMutableArray alloc] init];
    NSMutableArray *counts = [[NSMutableArray alloc]init];
    for (MyShoppingCell *cell in [self.tableView visibleCells])
    {
        
        NSString *price = [NSString stringWithFormat:@"%ld",[cell.PriceLabel.text integerValue]*[cell.Count.text integerValue]];
        
        NSLog(@"price%@",price);
        [presum addObject: price];
        [counts addObject:cell.Count.text];
    }
    
   
    
    
    NSArray *testArray = [NSArray arrayWithObjects:@"2", @"2", @"3", @"4", nil];
    
    NSNumber *sum = [testArray valueForKeyPath:@"@sum.intValue"];
    
    NSLog(@"sumsumsum%@",sum);

    
    
    
    
    NSNumber *count = [counts valueForKeyPath:@"@sum.intValue"];
    NSNumber *priceSum = [presum valueForKeyPath:@"@sum.intValue"];
    
    
    NSLog(@"sumsumsum%@,%@",count,priceSum);

    
    NSString *text = [NSString stringWithFormat:@"结算(%@)",count];
    
    self.PreSumLabel.text = [NSString stringWithFormat:@"￥%@", priceSum];
    [self.CountButton setTitle:text forState:UIControlStateNormal];
    [self.CountButton bk_addEventHandler:^(id sender) {
        for (MyShoppingCell *cell in [self.tableView visibleCells]){
        NSArray *subviews = [cell.contentView subviews];
        for(id view in subviews)
            if([view isKindOfClass:[UIButton class]]) {
//                view.selected = YES;
                [cell.contentView bringSubviewToFront:view];
            }
        }
    } forControlEvents:UIControlEventTouchUpInside];
 
}




@end
