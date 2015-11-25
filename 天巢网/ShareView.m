//
//  ShareView.m
//  天巢网
//
//  Created by 赵贺 on 15/11/20.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "ShareView.h"


#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"
#import <TencentOpenAPI/QQApiInterface.h>
@interface ShareView ()
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic,strong)NSArray *titleArr;

@end



@implementation ShareView


-(NSArray *)imageArr
{

    if (!_imageArr) {
        _imageArr = [NSArray arrayWithObjects:@"share_pengyouquan",@"share_wechat",@"share_qq",nil];
    }
    return _imageArr;
}

-(NSArray *)titleArr
{
    
    if (!_titleArr) {
        _titleArr = [NSArray arrayWithObjects:@"朋友圈",@"微信好友",@"QQ",nil];
    }
    return _titleArr;
}

-(id)initWithFrame:(CGRect)frame
{
    float Margin = ceilf(ApplicationframeValue.width/self.imageArr.count/2);
    
    self = [super initWithFrame:frame];
    if (self) {
        self.overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
        [self.overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        UIView *viewS = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ApplicationframeValue.width, 160)];
        viewS.backgroundColor =[UIColor whiteColor];
        [self addSubview:viewS];
        
        UILabel *TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((ApplicationframeValue.width-100)/2, 15, 100, 20)];
        TitleLabel.textAlignment = NSTextAlignmentCenter;
        TitleLabel.text = @"分享到";
        TitleLabel.backgroundColor = [UIColor whiteColor];
        TitleLabel.font = AppFont(text_size_other);
        [viewS addSubview:TitleLabel];
        
        UIImageView *lineImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 45, ApplicationframeValue.width, 1)];
        lineImage.alpha = 0.5f;
        lineImage.backgroundColor = Color_Hex16(@"#cccccc");;
        [viewS addSubview:lineImage];
     
        for (int i = 0; i < [self.imageArr count]; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i +1;
            btn.frame = CGRectMake(Margin/2+2*Margin*i,60, Margin, Margin);
            [btn setBackgroundImage:[UIImage imageNamed:self.imageArr[i]] forState:UIControlStateNormal];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(Margin/2+2*Margin*i, CGRectGetMaxY(btn.frame)+10, Margin, 15)];
            
            label.textAlignment = NSTextAlignmentCenter;
            label.text = self.titleArr[i];
            label.font = AppFont(text_size_little_2);
            label.adjustsFontSizeToFitWidth = YES;
            [btn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
            [viewS addSubview:label];
            [viewS addSubview:btn];
        }
        
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleBtn.frame = CGRectMake(ApplicationframeValue.width-25, 10, 20, 20);
        [cancleBtn setBackgroundImage:[UIImage imageNamed:@"share_btn_cancel"] forState:UIControlStateNormal];
        cancleBtn.backgroundColor = [UIColor whiteColor];
        [cancleBtn addTarget:self action:@selector(onCancleBtn) forControlEvents:UIControlEventTouchUpInside];
        [viewS addSubview:cancleBtn];
        
        
        
        
    }
    return self;
}



-(void)onBtn:(UIButton *)sender{
    
    switch (sender.tag) {
        //朋友圈
        case 1:{
            if ([WXApi isWXAppInstalled]) {
                id<ISSContent> publishContent = [ShareSDK content:nil defaultContent:nil image:nil title:nil url:nil description:nil             mediaType:SSPublishContentMediaTypeNews];
                [publishContent addWeixinTimelineUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeNews]content:self.message?self.message:INHERIT_VALUE
                    title:self.content?self.content:INHERIT_VALUE  url:self.shareUrl?self.shareUrl:INHERIT_VALUE

                                                   thumbImage:[ShareSDK imageWithPath:[[NSBundle mainBundle] pathForResource:self.pictureName ofType:@"png"]]
                                                        image:INHERIT_VALUE
                                                 musicFileUrl:nil
                                                      extInfo:nil
                                                     fileData:nil
                                                 emoticonData:nil];
                
                [ShareSDK showShareViewWithType:ShareTypeWeixiTimeline container:nil content:publishContent statusBarTips:NO authOptions:nil shareOptions:nil result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                    if (state == SSResponseStateSuccess)
                    {
                        AlertLog(@"", @"分享成功", @"确定", nil);
                    }
                    else if (state == SSResponseStateFail)
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"分享失败,错误码:%ld,错误描述:%@",(long)[error errorCode], [error errorDescription]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                        [alert show];
                    }
                    
                }];
            }
           
            else{
                AlertLog(@"", @"没有安装微信客户端，无法进行微信分享", @"确定", nil);
            }
        }
            break;

            
        //微信好友
        case 2:{
            if ([WXApi isWXAppInstalled]) {
                id<ISSContent> publishContent = [ShareSDK content:nil defaultContent:nil image:nil title:nil url:nil description:nil mediaType:SSPublishContentMediaTypeText];
                [publishContent addWeixinSessionUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeNews]
                                                     content:self.message?self.message:INHERIT_VALUE
                                                       title:self.content?self.content:INHERIT_VALUE
                                                         url:self.shareUrl?self.shareUrl:INHERIT_VALUE
                                                  thumbImage:[ShareSDK imageWithPath:[[NSBundle mainBundle] pathForResource:self.pictureName ofType:@"png"]]
                                                       image:INHERIT_VALUE
                                                musicFileUrl:nil
                                                     extInfo:nil
                                                    fileData:nil
                                                emoticonData:nil];
                
                
                [ShareSDK showShareViewWithType:ShareTypeWeixiSession container:nil content:publishContent statusBarTips:NO authOptions:nil shareOptions:nil result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                    if (state == SSResponseStateSuccess)
                    {
                        AlertLog(@"", @"分享成功", @"确定", nil);
                    }
                    else if (state == SSResponseStateFail)
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"分享失败,错误码:%ld,错误描述:%@",(long)[error errorCode], [error errorDescription]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                        [alert show];
                    }
                    
                }];
            }
            else{
                AlertLog(@"", @"没有安装微信客户端，无法进行微信分享", @"确定", nil);
            }
        }
        break;
         //QQ好友
        case 3:{
            if ([QQApiInterface isQQInstalled]) {
                id<ISSContent> publishContent = [ShareSDK content:nil defaultContent:nil image:nil title:nil url:nil description:nil mediaType:SSPublishContentMediaTypeNews];
                [publishContent addQQUnitWithType:[NSNumber numberWithInteger:SSPublishContentMediaTypeNews]
                                          content:self.message?self.message:INHERIT_VALUE
                                            title:self.content?self.content:INHERIT_VALUE
                                              url:self.shareUrl?self.shareUrl:INHERIT_VALUE
                                              image:INHERIT_VALUE];
                 
                 
                 [ShareSDK showShareViewWithType:ShareTypeQQ container:nil content:publishContent statusBarTips:NO authOptions:nil shareOptions:nil result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                     if (state == SSResponseStateSuccess)
                     {
                         AlertLog(@"", @"分享成功", @"确定", nil);
                     }
                     else if (state == SSResponseStateFail)
                     {
                         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"分享失败,错误码:%ld,错误描述:%@",(long)[error errorCode], [error errorDescription]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                         [alert show];
                     }
                    
                 }];
            }
            else{
                AlertLog(@"", @"没有安装QQ客户端，无法进行QQ分享", @"确定", nil);
            
                 }
            }
                 break;
                 
    }
}

-(void)onCancleBtn{

    [self dismiss];

}


- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self.overlayView];
    [keywindow addSubview:self];
    
    [self fadeIn];
}

- (void)dismiss
{
    [self fadeOut];
}

//弹入层
- (void)fadeIn
{

    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
       
        self.alpha = 1;
 
    }];
    
}

//弹出层
- (void)fadeOut
{
    [UIView animateWithDuration:.35 animations:^{

        self.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        if (finished) {
            [self.overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
}


@end
