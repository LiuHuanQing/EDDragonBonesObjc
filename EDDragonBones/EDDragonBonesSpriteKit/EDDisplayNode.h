//
//  EDDisplayNode.h
//  EDDragonBones
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EDTransform.h"
@interface EDDisplayNode : SKSpriteNode
- (instancetype)initWithTransform:(EDTransform *)transform texture:(SKTexture *)texture;
@end
