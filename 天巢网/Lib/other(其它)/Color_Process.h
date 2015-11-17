//
//  Color_Process.h

//  **颜色处理

#import <Foundation/Foundation.h>

@interface Color_Process : NSObject
#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *) colorWithHexString: (NSString *)color;
@end
