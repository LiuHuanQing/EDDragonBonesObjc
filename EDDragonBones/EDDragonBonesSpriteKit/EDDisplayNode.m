//
//  EDDisplayNode.m
//  EDDragonBones
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDDisplayNode.h"
#import "SKNode+EDBone.h"
@implementation EDDisplayNode
- (instancetype)initWithTransform:(EDTransform *)transform texture:(SKTexture *)texture
{
    self = [super initWithTexture:texture color:[UIColor clearColor] size:texture.size];
    if(self)
    {
        self.transform = transform;
    }
    return self;
}
@end
