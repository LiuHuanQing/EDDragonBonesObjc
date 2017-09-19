//
//  EDSlotNode.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDSlotNode.h"

@implementation EDSlotNode
- (instancetype)initWithSlot:(EDSlot *)slot
{
    self = [super init];
    if (self) {
        self.name = slot.name;
        self.zPosition = (CGFloat)slot.z / 100.0;
    }
    return self;
}
@end
