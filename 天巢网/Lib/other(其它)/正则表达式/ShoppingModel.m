//
//  ShoppingModel.m
//  天巢网
//
//  Created by 赵贺 on 15/11/30.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "ShoppingModel.h"
static ShoppingModel *shop = nil;
@implementation ShoppingModel


+(ShoppingModel *)shoppingModel
{
    @synchronized(self) {
        if (!shop) {
            shop = [[ShoppingModel alloc]init];
            return shop;
        }
        return shop;
    }

}
+(NSMutableArray *)demoData
{
    ShoppingModel *model = [[self alloc] init];
    model.ProductName = @"实木床实木床实木床实木床实木床";
    model.Price = @"4999";
    model.Count = @"1";
    model.Selected = NO;

    ShoppingModel *model1 = [[self alloc] init];
    model1.ProductName = @"白色的 ";
    model1.Price = @"999";
    model1.Count = @"1";
    model1.Selected = NO;

    ShoppingModel *model2 = [[self alloc] init];
    model2.ProductName = @"实床";
    model2.Price = @"4999";
    model2.Count = @"2";
    model2.Selected = NO;
    
    ShoppingModel *model3 = [[self alloc] init];
    model3.ProductName = @"实床";
    model3.Price = @"4999";
    model3.Count = @"2";
    model3.Selected = NO;
    
    ShoppingModel *model4 = [[self alloc] init];
    model4.ProductName = @"实床";
    model4.Price = @"4299";
    model4.Count = @"2";
    model4.Selected = NO;
    
    ShoppingModel *model5 = [[self alloc] init];
    model5.ProductName = @"实床实木床";
    model5.Price = @"344";
    model5.Count = @"2";
    model5.Selected = NO;
    
    ShoppingModel *model6 = [[self alloc] init];
    model6.ProductName = @"床";
    model6.Price = @"599";
    model6.Count = @"2";
    model6.Selected = NO;
    
    ShoppingModel *model7 = [[self alloc] init];
    model7.ProductName = @"实实木床";
    model7.Price = @"788";
    model7.Count = @"2";
    model7.Selected = NO;
    
    return [NSMutableArray arrayWithObjects:model,model1,model2,model3,model4,model5,model6,model7, nil];
}
@end
