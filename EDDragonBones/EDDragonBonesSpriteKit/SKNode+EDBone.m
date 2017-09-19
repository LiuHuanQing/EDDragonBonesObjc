//
//  SKNode+EDBone.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "SKNode+EDBone.h"
#import <objc/runtime.h>
@implementation SKNode (EDBone)
static char kAssociatedTransformObjectKey;


- (instancetype)initWithBone:(EDBone *)bone
{
    self = [self init];
    if (self) {
        self.name = bone.name;
        self.transform = bone.transform;
    }
    return self;
}

- (void)setTransform:(EDTransform *)transform
{
    objc_setAssociatedObject(self, &kAssociatedTransformObjectKey, transform, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.xScale = transform.scX;
    self.yScale = transform.scY;
    self.position = transform.position;
    self.zRotation = transform.zRotation;
}

- (EDTransform *)transform
{
    EDTransform *transform = [[EDTransform alloc] initWithScx:self.xScale scY:self.yScale zRotation:self.zRotation position:self.position];
    return transform;
}


@end
