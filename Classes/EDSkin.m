//
//  EDSkin.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDSkin.h"

@implementation EDSkinSlotDisplay
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        _name = json[@"name"];
        _type = json[@"type"];
        _transform = [[EDTransform alloc] initWithJson:json[@"transform"]];
    }
    return self;
}

@end

@implementation EDSkinSlot

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        NSArray *displayJSON = json[@"display"];
        NSMutableArray *theDisplay = [NSMutableArray arrayWithCapacity:displayJSON.count];
        for (NSDictionary *item in displayJSON)
        {
            [theDisplay addObject:[[EDSkinSlotDisplay alloc] initWithJson:item]];
        }
        _display = [theDisplay copy];
        _name = json[@"name"];
    }
    return self;
}

@end

@implementation EDSkin

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        _name = json[@"name"];
        NSArray *slotJSON = json[@"slot"];
        NSMutableArray *theSlot = [NSMutableArray arrayWithCapacity:slotJSON.count];
        
        for (NSDictionary *item in slotJSON)
        {
            [theSlot addObject:[[EDSkinSlot alloc] initWithJson:item]];
        }
        _slot = [theSlot copy];
    }
    return self;
}
@end
