//
//  EDAction.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDAction.h"

@implementation EDAction
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        _gotoAndPlay = json[@"gotoAndPlay"];
    }
    return self;
}
@end
