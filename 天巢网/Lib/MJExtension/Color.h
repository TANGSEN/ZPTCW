//
//  Color.h
//  微博
//
//  Created by This is GeGe iMac on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#ifndef ___Color_h
#define ___Color_h
#define Color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define RandomColor Color(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif
