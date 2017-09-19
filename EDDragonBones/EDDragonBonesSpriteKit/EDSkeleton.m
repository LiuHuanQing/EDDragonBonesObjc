//
//  EDSkeleton.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDSkeleton.h"


@implementation EDSkeleton
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        _frameRate = [json[@"frameRate"] integerValue];
        _version = json[@"version"];
        _isGlobal = [json[@"isGlobal"] integerValue];
        _name = json[@"name"];
        
        NSArray *armatureJSON = json[@"armature"];
        _armature = [NSMutableArray arrayWithCapacity:armatureJSON.count];
        
        for (NSDictionary *item in armatureJSON)
        {
            [_armature addObject:[[EDArmature alloc] initWithJson:item]];
        }
    }
    return self;
}
@end
