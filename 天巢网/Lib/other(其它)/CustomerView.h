//
//  CustomerView.h

//自定义头部标签选择器

#import <UIKit/UIKit.h>

@protocol CustomerDelegate <NSObject>

@optional
- (void)OnclickCustomerTag:(NSInteger)customerTag;
@end



@interface CustomerView : UIView
{
    /**底线*/
    UIImageView *lineView;
}
- (id)initWithFrame:(CGRect)frame  initButWithArray:(NSArray*)subjects;

@property(nonatomic,assign)id<CustomerDelegate> delegate;
//**选项卡标签
@property(nonatomic,strong)NSMutableArray *btnArray;
//**记录当前的tag
@property(nonatomic,assign)NSInteger currentIndex;



@end

