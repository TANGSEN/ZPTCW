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

static NSString *kBackendChargeURL = @"www.skyhives.com";

@interface MyShoppingController ()
@property (nonatomic,strong)ShoppingModel *model;
@property (nonatomic,strong)MyShoppingCell *cell;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,strong)UITableView *table;
@property (assign, nonatomic) NSInteger PreSum;

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
            for (ShoppingModel *model in self.arr) {
                
                model.Selected = NO;
                self.PreSum = 0;
                self.PreSumLabel.text = [NSString stringWithFormat:@"￥%ld",(long)self.PreSum];
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
