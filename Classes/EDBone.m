//
//  EDBone.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDBone.h"

@implementation EDBone
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        _transform = [[EDTransform alloc] initWithJson:json[@"transform"]];
        _name = json[@"name"];
        _parent = json[@"parent"];
    }
    return self;
}
@end
