//
//  TCStoryModel.m
//  天巢网
//
//  Created by tangjp on 15/11/20.
//  Copyright © 2015年 tangjp. All rights reserved.
//

#import "TCStoryModel.h"

@interface TCStoryModel ()


@end

static NSArray *_storys;

@implementation TCStoryModel
+ (NSArray *)storys{
    if (!_storys) {
        _storys = [TCStoryModel mj_objectArrayWithFilename:@"StoryList.plist"];
    }
    return _storys;
}
@end
