//
//  SKAction+EDAdd.m
//  EDDragonBones
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "SKAction+EDAdd.h"
#import "SKNode+EDBone.h"
@implementation SKAction (EDAdd)
+ (instancetype)boneFrameAction:(NSArray<EDAnimationBoneFrame *> *)frame duration:(NSTimeInterval)duration
{
    NSMutableArray *sequenceActionArray = [NSMutableArray arrayWithCapacity:frame.count];
    for (EDAnimationBoneFrame *theFrame in frame)
    {
        NSTimeInterval frameDuration = theFrame.duration;
//        NSLog(@"theFrame.tweenEasing %d",theFrame.tweenEasing);
//        printf("scX %0.06f,scY %0.06f,z %0.06f,(x:%0.06f,y:%0.06f),frameDuration:%0.06f,duration %0.06f\n",theFrame.transform.scX,theFrame.transform.scY,theFrame.transform.zRotation,theFrame.transform.position.x,theFrame.transform.position.y,frameDuration,duration);
        if (theFrame.tweenEasing)
        {
            SKAction *positionAction = [SKAction moveTo:theFrame.transform.position duration:frameDuration];
            SKAction *scaleXAction = [SKAction scaleXTo:theFrame.transform.scX duration:frameDuration];
            SKAction *scaleYAction = [SKAction scaleYTo:theFrame.transform.scY duration:frameDuration];
            SKAction *zRotationAction = [SKAction rotateToAngle:theFrame.transform.zRotation duration:frameDuration];
            SKAction *groupAction = [SKAction group:@[positionAction,scaleXAction,scaleYAction,zRotationAction]];
            [sequenceActionArray addObject:groupAction];
        }
        else
        {
            SKAction *sequenceAction = [SKAction
                                        sequence:@[[SKAction waitForDuration:frameDuration],
                                                   [SKAction customActionWithDuration:0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
                node.transform = theFrame.transform;
            }]]];
            [sequenceActionArray addObject:sequenceAction];
        }
    }
    SKAction *sequenceAction = [SKAction sequence:sequenceActionArray];
    sequenceAction.duration = duration;
    return sequenceAction;
}

+ (instancetype)slotFrameAction:(NSArray<EDAnimationSlotFrame *> *)frame duration:(NSTimeInterval)duration
{
    NSMutableArray *sequenceActionArray = [NSMutableArray arrayWithCapacity:frame.count];
    for (EDAnimationSlotFrame *theFrame in frame)
    {
        SKAction *frameAction = nil;
        NSTimeInterval duration = theFrame.duration;
        if (theFrame.tweenEasing)
        {
            frameAction = [SKAction fadeAlphaTo:theFrame.color.alpha duration:duration];
        }
        else
        {
            frameAction = [SKAction waitForDuration:duration];
        }
        SKAction *displayAction = [SKAction customActionWithDuration:0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
            for (int i = 0; i < node.children.count; i++)
            {
                node.children[i].hidden = (i != theFrame.displayIndex);
            }
        }];
        SKAction *subSeq = [SKAction sequence:@[frameAction,displayAction]];
        [sequenceActionArray addObject:subSeq];
    }
    SKAction *sequenceAction = [SKAction sequence:sequenceActionArray];
    sequenceAction.duration = duration;
    return sequenceAction;
}
@end
