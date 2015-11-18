//
//  CustomerView.m


#import "CustomerView.h"

@implementation CustomerView




- (id)initWithFrame:(CGRect)frame  initButWithArray:(NSArray*)subjects butFont:(NSInteger)font
{
    self=[super initWithFrame:frame];
    
    if(self)
    {
        self.btnArray = [NSMutableArray arrayWithCapacity:0];

        self.backgroundColor=[UIColor whiteColor];
        
        CGRect rct=self.frame;
        
        float width=rct.size.width;
        
        float cel=ceilf(width/[subjects count]);
        
        lineView=[[UIImageView alloc]initWithFrame:CGRectMake(cel/3, 0+rct.size.height-1, cel/3, 1)];
        
//        df2222   #fc8320
        lineView.backgroundColor=Color_Hex16(@"df2222");
        [lineView setUserInteractionEnabled:YES];
        self.currentIndex = 1;
        for (int i=0; i<[subjects count]; i++) {
            
            UIButton *butTitle = [UIButton buttonWithType:0];
            butTitle.tag=i+1;
            
            [butTitle setTitle:[subjects objectAtIndex:i] forState:UIControlStateNormal];
            
            [butTitle setTitle:[subjects objectAtIndex:i] forState:UIControlStateSelected];
            
            
            [butTitle setTitleColor:Color_Common forState:UIControlStateNormal];
            
            [butTitle setTitleColor:Color_Hex16(@"df2222") forState:UIControlStateSelected];
            
            [self.btnArray addObject:butTitle];
            
            //设置第一个为默认的
            if (self.currentIndex == butTitle.tag) {
                butTitle.selected = YES;
                
            }else{
                
                butTitle.selected = NO;
            }
            
            
            butTitle.titleLabel.font =AppFont(font);
            [butTitle setFrame:CGRectMake(i*cel+cel/4, 0, cel/2, rct.size.height-1)];

            
            [butTitle addTarget:self action:@selector(Onclick:) forControlEvents:UIControlEventTouchUpInside];
            butTitle.userInteractionEnabled = YES;
            [self addSubview:butTitle];
            
            
        }
        [self addSubview:lineView];
        
        [self setUserInteractionEnabled:YES];
    }
    return self;
}



- (void)Onclick:(UIButton *)but
{
    but.selected = YES;
    
    for (UIButton *button in self.btnArray) {
        if (![button isEqual:but]) {
            [button setSelected:NO];
            
        }
    }
    
    NSInteger SelectTag=but.tag;

    NSLog(@"SelectTag===========%tu",SelectTag);
    
    if([self.delegate conformsToProtocol:@protocol(CustomerDelegate)])
    {
        [self.delegate OnclickCustomerTag:SelectTag];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            [lineView setFrame:CGRectMake(but.frame.origin.x,0+but.frame.size.height-1, but.frame.size.width, 1)];
     
        } completion:^(BOOL finished){
            
            self.currentIndex = but.tag;

            
            
        }];
    
    }
    
}

@end



