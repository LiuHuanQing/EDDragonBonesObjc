//
//  EDArmatureNode.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EDArmature.h"
@class EDArmatureLoader;
@interface EDArmatureNode : SKNode
- (instancetype)initWithArmature:(EDArmature *)armature loader:(EDArmatureLoader *)loader;
- (void)repeatAnimation:(NSString *)name;
@end
