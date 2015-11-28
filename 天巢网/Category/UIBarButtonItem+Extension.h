//
//  UIBarButtonItem+Extension.h
//  天巢网
//
//  Created by 赵贺 on 15/11/17.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)barButtonItemWithBg:(NSString *)bg title:(NSString *)title target:(id)target action:(SEL)action;
@end
