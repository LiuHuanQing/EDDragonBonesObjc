//
//  EDSlot.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDSlot.h"

@implementation EDSlot
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        _name = json[@"name"];
        _parent = json[@"parent"];
        _z = json[@"z"]?[json[@"z"] integerValue]:0;
        _displayIndex = json[@"displayIndex"]?[json[@"displayIndex"] integerValue]:0;
    }
    return self;
}
@end
