//
//  SKNode+EDBone.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EDTransform.h"
#import "EDBone.h"
@interface SKNode (EDBone)
@property (nonatomic, strong) EDTransform *transform;
- (instancetype)initWithBone:(EDBone *)bone;
@end
