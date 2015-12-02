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
#import "ShoppingModel.h"
#import "Pingpp.h"

static NSString *kBackendChargeURL = @"http://218.244.151.190/demo/charge";

@interface MyShoppingController ()
@property (nonatomic,strong)ShoppingModel *model;
@property (nonatomic,strong)MyShoppingCell *cell;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,strong)UITableView *table;

@property (nonatomic, retain) NSArray *itemCounts;

@end

@implementation MyShoppingController

-(NSArray *)arr
{
    if (!_arr) {
        _arr = [ShoppingModel demoData];
    }
    return _arr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Pingpp setDebugMode:YES];
    /**全选按钮*/
    UIButton *BottomButton = [[UIButton alloc] initWithFrame:CGRectMake(8, 15, 25, 25)];
    [self.BottomView addSubview:BottomButton];
    
    [BottomButton setBackgroundImage:[UIImage imageNamed:@"购物车_11"] forState:UIControlStateNormal];
    [BottomButton setBackgroundImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];

    [BottomButton bk_addEventHandler:^(id sender) {
        BottomButton.selected = !BottomButton.selected;
        if (BottomButton.selected) {
            for (ShoppingModel *model in self.arr) {
                
                model.Selected = YES;
                
            }
        }else
        {
            for (ShoppingModel *model in self.arr) {
                
                model.Selected = NO;
                
            }
            
        }
        [self.table reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, ApplicationframeValue.height-64-70)];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];


    /**结算按钮*/
    [self.CountButton bk_addEventHandler:^(id sender) {

        NSString *orderNo = [MyShoppingController rand_str:12]; // orderNo 一般在服务器生成
        
        NSArray *contents = @[
                              @[@"商品", @[@"Kaico 搪瓷水壶 x 1", @"橡胶花瓶 x 1", @"扫把和簸箕 x 1"]],
                              @[@"运费", @[@"¥ 0.00"]]
                            ];
        [Pingpp payWithOrderNo:orderNo amount:10000 display:contents serverURL:kBackendChargeURL customParams:@{@"custom_key_1":@"custom_value_1",@"custom_key_2":@"custom_value_2"} appURLScheme:@"wx25d9ec509a6dbfca" viewController:self completionHandler:^(NSString *result, PingppError *error) {
            NSLog(@">>>>>>> %@", result);
        }];
        
    } forControlEvents:UIControlEventTouchUpInside];

}


+ (NSString *)rand_str:(int) l {
    char pool[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char data[l];
    for (int x=0;x<l;data[x++] = (char)(pool[arc4random_uniform(62)]));
    return [[NSString alloc] initWithBytes:data length:l encoding:NSUTF8StringEncoding];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 15;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShoppingModel *model = self.arr[indexPath.section];
    static NSString *ID  = @"cell";
    MyShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyShoppingCell" owner:self options:nil] lastObject];
    }
    UIButton *ChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    ChooseButton.frame = CGRectMake(8, 15, 25, 25);
    [ChooseButton setBackgroundImage:[UIImage imageNamed:@"购物车_11"] forState:UIControlStateNormal];
    [ChooseButton setBackgroundImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];
    ChooseButton.tag = indexPath.section;
  
    [cell.contentView addSubview:ChooseButton];
    ChooseButton.selected = model.Selected;

    [ChooseButton bk_addEventHandler:^(id sender) {
        
        model.Selected = !model.Selected;
        [self.table reloadData];
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    cell.Count.text = model.Count;
    cell.PriceLabel.text = model.Price;
    cell.ProductDetailLabel.text = model.ProductName;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self getRoundCorner:cell.StepperView];
    cell.Imageline1.backgroundColor = [UIColor lightGrayColor];
    cell.Imageline2.backgroundColor = [UIColor lightGrayColor];
    

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}
-(UIView *)getRoundCorner:(UIView *)vView
{
    
    vView.layer.borderWidth  = 0.8f;
    vView.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5].CGColor;
    vView.layer.cornerRadius = 3.0f;
    [vView.layer setMasksToBounds:YES];
    
    
    return nil;
    
    
}




@end
