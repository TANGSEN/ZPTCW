//
//  MyShoppingController.m
//  天巢网
//
//  Created by 赵贺 on 15/11/24.
//  Copyright © 2015年 tangjp. All rights reserved.
//

/**
 
 1、cell 内
 ·选择按钮需要即时刷新总价（改变数据源，重新reload）
 ·stepper 加减 需要改变的是数量，（改变数据源数量）
 ①如果此时按钮是选中状态，总价需要变化
 ②非选择状态，则不需要
 ·删除按钮需要改变数据源，页面即时刷新（包括总价，视图）
 
 2、全选按钮 改变的是总价  直接对数据源遍历
 
 3、结算按钮 如果总价为0，则不能点击
 结算之前对数据源进行遍历，传递商品详情
 
 4、有一个按钮没选择的话 下面的全选按钮的状态应该变为 未选中状态
 
 */




#import "MyShoppingController.h"
#import "TCShoppingTable.h"
#import "MyShoppingCell.h"
#import "ShoppingModel.h"
#import "Pingpp.h"

static NSString *kBackendChargeURL = @"www.skyhives.com";

@interface MyShoppingController ()
@property (nonatomic,strong)   ShoppingModel *model;
@property (nonatomic,strong)   MyShoppingCell *cell;
/**数据*/
@property (nonatomic,strong)   NSMutableArray *arr;
/**cell视图*/
@property (nonatomic,strong)   UITableView *table;
@property (assign, nonatomic)  NSInteger PreSum;
@property (assign,nonatomic)   NSUInteger  SelectedNumber;
@property (nonatomic, retain)  NSArray *itemCounts;

@end

@implementation MyShoppingController

#pragma mark - lazy loading
-(NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [ShoppingModel demoData];
    }
    return _arr;
}

-(NSInteger)PreSum
{
    if (!_PreSum) {
        _PreSum = 0;
    }
    return _PreSum;
}


-(NSUInteger)SelectedNumber
{
    if (!_SelectedNumber) {
        _SelectedNumber = 0 ;
    }
    return _SelectedNumber;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [Pingpp setDebugMode:YES];
    self.PreSumLabel.text = @"￥0";
    
    /**全选按钮*/
    UIButton *BottomButton = [[UIButton alloc] initWithFrame:CGRectMake(8, 15, 25, 25)];
    [self.BottomView addSubview:BottomButton];
    [BottomButton setBackgroundImage:[UIImage imageNamed:@"购物车_11"] forState:UIControlStateNormal];
    [BottomButton setBackgroundImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];
    
    [BottomButton bk_addEventHandler:^(id sender) {
        BottomButton.selected = !BottomButton.selected;
        if (BottomButton.selected == YES) {
            self.PreSum = 0;
            
            for (ShoppingModel *model in self.arr) {
                model.Selected = YES;
                self.PreSum += [model.Price integerValue]*[model.Count integerValue];
                self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
                NSLog(@"%ld",self.PreSum);
                
            }
        }else
        {
            self.SelectedNumber = 0;
            for (ShoppingModel *model in self.arr) {
                model.Selected = NO;
                self.PreSum = 0;
                self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
            }
            
        }
        
        self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
        
        [self.table reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, ApplicationframeValue.height-64-70)];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
    
    /**结算按钮*/
    
    [self.CountButton bk_addEventHandler:^(id sender) {
        if (self.PreSum!=0) {
            NSString *orderNo = [MyShoppingController rand_str:12]; // orderNo 一般在服务器生成
            
            //        NSArray *contents = @[
            //                              @[@"商品", @[@"Kaico 搪瓷水壶 x 1", @"橡胶花瓶 x 1", @"扫把和簸箕 x 1"]],
            //                              @[@"运费", @[@"¥ 0.00"]]
            //                            ];
            [Pingpp payWithOrderNo:orderNo amount:self.PreSum*100 display:nil serverURL:kBackendChargeURL customParams:nil appURLScheme:@"wx25d9ec509a6dbfca" viewController:self completionHandler:^(NSString *result, PingppError *error) {
                NSLog(@">>>>>>> %@", result);
            }];
        }
    } forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark - 产生随机订单号
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
        if (model.Selected) {
            
            
            self.PreSum += [model.Price integerValue]*[model.Count integerValue];
            
            NSLog(@"%ld",self.PreSum);
            
            self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
        }else
        {
            self.PreSum -= [model.Price integerValue]*[model.Count integerValue];;
            
            
            NSLog(@"%ld",self.PreSum);
            self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
            
        }
        [self.table reloadData];
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    cell.Count.text = model.Count;
    cell.PriceLabel.text =[NSString stringWithFormat:@"￥%@",model.Price];
    cell.ProductDetailLabel.text = model.ProductName;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self getRoundCorner:cell.StepperView];
    cell.Imageline1.backgroundColor = [UIColor lightGrayColor];
    cell.Imageline2.backgroundColor = [UIColor lightGrayColor];
    
    [cell.PlusButton bk_addEventHandler:^(id sender) {
        model.Count = [NSString stringWithFormat:@"%ld",[model.Count integerValue]+1];
        if (model.Selected) {
            self.PreSum += [model.Price integerValue];
            self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
        }
        cell.Count.text = [NSString stringWithFormat:@"%ld",[model.Count integerValue]];
        [self.table reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [cell.DecreaseButton bk_addEventHandler:^(id sender) {
        if ([model.Count integerValue]==1) {
            return ;
        }
        model.Count = [NSString stringWithFormat:@"%ld",[model.Count integerValue]-1];
        
        cell.Count.text = [NSString stringWithFormat:@"%ld",[model.Count integerValue]];
        if (model.Selected) {
            
            self.PreSum -= [model.Price integerValue];
            
            self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
        }
        [self.table reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
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
