//
//  RXCollectionController.m
//  天巢网
//
//  Created by tangjp on 15/11/13.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCJPCollectionController.h"
#import "TCJPCollectionCell.h"
#import "TCDetailTableController.h"

#define ItemH 180
#define ItemW (JPScreenW - 30) / 2
#define ItemSize CGSizeMake(ItemW, ItemH)

@interface TCJPCollectionController ()
@property (nonatomic ,strong) TCDetailTableController *detailController;
@end

@implementation TCJPCollectionController

static NSString * const reuseIdentifier = @"Cell";



+ (CGFloat)height{
    return ((10 / 2) + (10 % 2)) * ItemH + (((10 / 2) + (10 % 2)) * JPMargin);
}

- (TCDetailTableController *)detailController{
    if (!_detailController){
        _detailController = [[TCDetailTableController alloc]init];
    }
    return _detailController;
}



- (id)init
{
    // 创建一个布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置每一个item的宽高
    layout.itemSize = ItemSize;
    layout.sectionInset = UIEdgeInsetsMake(0, JPMargin, 0, JPMargin);
    // 在初始化的时候传入自己创建的布局对象
    if (self = [super initWithCollectionViewLayout:layout]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.bounces = NO;
    [self.collectionView registerClass:[TCJPCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TCJPCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    for (UIView *subView in cell.contentView.subviews)
    {
        [subView removeFromSuperview];
    }
    cell.imageName = [NSString stringWithFormat:@"%ld",indexPath.item + 1];
    cell.title = self.titles[indexPath.item];
    cell.price = rand() % 10000;
    cell.sales = rand() % 10000;
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld个item",(long)indexPath.item);
    self.collectionView.userInteractionEnabled = YES;
    TCDetailTableController *vc = [[TCDetailTableController alloc]init];
    vc.view.userInteractionEnabled = YES;
    self.detailController = vc;
    [self.navigationController pushViewController:vc animated:YES];
}












@end
