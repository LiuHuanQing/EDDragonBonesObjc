//
//  SKAction+EDAdd.h
//  EDDragonBones
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "EDAnimation.h"
@interface SKAction (EDAdd)
+ (instancetype)boneFrameAction:(NSArray<EDAnimationBoneFrame *> *)frame duration:(NSTimeInterval)duration;
+ (instancetype)slotFrameAction:(NSArray<EDAnimationSlotFrame *> *)frame duration:(NSTimeInterval)duration;
@end
