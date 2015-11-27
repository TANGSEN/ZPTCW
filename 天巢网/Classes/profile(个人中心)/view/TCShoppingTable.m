//
//  TCShoppingTable.m
//  天巢网
//
//  Created by 赵贺 on 15/11/25.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCShoppingTable.h"
#import "MyShoppingCell.h"

@interface TCShoppingTable ()
@property (nonatomic,strong)UIButton *chooseButton;
@property (nonatomic,strong)MyShoppingCell *cell;
@property (nonatomic,strong)NSMutableArray *status;
@end
@implementation TCShoppingTable



-(NSMutableArray *)status
{

    if (!_status) {
        _status = [NSMutableArray arrayWithObjects:@(NO),@(NO),@(NO),@(NO),@(NO),@(NO),@(NO),@(NO), nil];
    }
    return _status;
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
    
    static NSString *ID  = @"cell";
    MyShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    NSInteger thisTag  = 100 *indexPath.section + indexPath.row;
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyShoppingCell" owner:self options:nil] lastObject];
        
        UIButton *ChooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
         ChooseButton.frame = CGRectMake(8, 15, 25, 25);
        [ChooseButton setBackgroundImage:[UIImage imageNamed:@"购物车_11"] forState:UIControlStateNormal];
        [ChooseButton setBackgroundImage:[UIImage imageNamed:@"购物车_03"] forState:UIControlStateSelected];
        ChooseButton.tag = indexPath.section;
        ChooseButton.selected = (BOOL)self.status[indexPath.section];
//        ChooseButton.tag = 100 *indexPath.section + indexPath.row;
        [self.buttons addObject:ChooseButton];
        
        [ChooseButton bk_addEventHandler:^(id sender) {
            UIButton *button = (UIButton *)sender;

            
            
            
//            NSArray *visibleCells = [self visibleCells];
//            for(UITableViewCell *cell in visibleCells) {
//                if(cell.tag == button.tag) {
//                    button.selected = YES;
//                    break;
//                }
//            }
            
           
            
        } forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:ChooseButton];
    }
    
    
    cell.tag = thisTag;
    NSArray *subviews = [cell.contentView subviews];
    for(id view in subviews)
        if([view isKindOfClass:[UIButton class]]) {
            [view setTag:thisTag];
            [cell.contentView bringSubviewToFront:view];
        }
    cell.Count.text = @"1";
    cell.PriceLabel.text = @"100";
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


//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    NSLog(@"点击了第%ld区,第%ld行",(long)indexPath.section,(long)indexPath.row);
//    self.chooseButton = (UIButton *)[self.cell viewWithTag:100*indexPath.section + indexPath.row];
//    NSLog(@"tag%ld",(long)self.chooseButton.tag);
//       self.chooseButton.selected = !self.chooseButton.selected;
//
//
//
//}
-(UIView *)getRoundCorner:(UIView *)vView
{
    
    vView.layer.borderWidth  = 0.8f;
    vView.layer.borderColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5].CGColor;
    vView.layer.cornerRadius = 3.0f;
    [vView.layer setMasksToBounds:YES];
    
    
    return nil;
    
    
}

@end
