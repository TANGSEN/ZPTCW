//
//  TCShoppingTable.m
//  天巢网
//
//  Created by 赵贺 on 15/11/25.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCShoppingTable.h"
#import "MyShoppingCell.h"
#import "ShoppingModel.h"
@interface TCShoppingTable ()
//@property (nonatomic,strong)UIButton *chooseButton;
@property (nonatomic,strong)MyShoppingCell *cell;
@property (nonatomic,strong)NSArray *arr;
@end
@implementation TCShoppingTable



-(NSArray *)arr
{
    if (!_arr) {
        _arr = [ShoppingModel demoData];
    }
    return _arr;
}

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    self.delegate = self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator = NO;
    
    
    return self;
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 8;
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
    NSInteger thisTag  = 100 *indexPath.section + indexPath.row;
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyShoppingCell" owner:self options:nil] lastObject];
    }
        UIButton *ChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
         ChooseButton.frame = CGRectMake(8, 15, 25, 25);
        [ChooseButton setBackgroundImage:[UIImage imageNamed:@"购物车_11"] forState:UIControlStateNormal];
        [ChooseButton setBackgroundImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];
        ChooseButton.tag = indexPath.section;
//        ChooseButton.tag = 100 *indexPath.section + indexPath.row;
//        [self.buttons addObject:ChooseButton];
        [cell.contentView addSubview:ChooseButton];

        [ChooseButton bk_addEventHandler:^(id sender) {
            
            model.Selected = !model.Selected;
            [self reloadData];
            
           
            
        } forControlEvents:UIControlEventTouchUpInside];

    cell.Count.text = model.Count;
    cell.PriceLabel.text = model.Price;
    cell.ProductDetailLabel.text = model.ProductName;
    ChooseButton.selected = model.Selected;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [self getRoundCorner:cell.StepperView];
    cell.Imageline1.backgroundColor = [UIColor lightGrayColor];
    cell.Imageline2.backgroundColor = [UIColor lightGrayColor];
    
    
    self.cell = cell;
//    全选
    
//    for (int row=0; row<10; row++) {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
//        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
//    }
    
    
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
