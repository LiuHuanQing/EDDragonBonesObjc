//
//  EDAnimation.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDAnimation.h"
@implementation EDAnimationBoneFrame
@end

@implementation EDAnimationSlotFrameColor

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        self.alpha = (json[@"aM"]? [json[@"aM"] floatValue]:100.f)/100.f;
    }
    return self;
}
@end

@implementation EDAnimationBone
- (instancetype)initWithJson:(NSDictionary *)json boneTransforms:(NSDictionary *)boneTransforms frameRate:(NSInteger)frameRate
{
    self = [super init];
    if (self) {
        _name = json[@"name"];
        NSArray *frameJSON = json[@"frame"];
        NSMutableArray *theFrame = [NSMutableArray arrayWithCapacity:frameJSON.count];
        NSDictionary *lastItem;
        for (NSDictionary *item in frameJSON)
        {
            EDTransform *transform = [[EDTransform alloc] initWithJson:item[@"transform"] defaultTransform:boneTransforms[_name]];
            NSTimeInterval duration;
            BOOL tweenEasing;
            if(lastItem)
            {
                duration = 1.0 / (NSTimeInterval)frameRate * (NSTimeInterval)([lastItem[@"duration"] intValue]);
                tweenEasing = (lastItem[@"tweenEasing"] != nil); // if not int is no
            }
            else
            {
                duration = 0;
                tweenEasing = NO;
            }
            EDAnimationBoneFrame *frame = [EDAnimationBoneFrame new];
            frame.tweenEasing = tweenEasing;
            frame.transform = transform;
            frame.duration = duration;
            [theFrame addObject:frame];
            lastItem = item;
            

        }
        
        NSInteger lastDuration = [[frameJSON lastObject][@"duration"] intValue];
        if (lastDuration != 0)
        {
            EDAnimationBoneFrame *firstFrame = theFrame.firstObject;
            
            EDAnimationBoneFrame *frame = [EDAnimationBoneFrame new];
            frame.tweenEasing = NO;
            frame.transform = firstFrame.transform;
            frame.duration = 1.0 / (NSTimeInterval)frameRate * (NSTimeInterval)lastDuration;
            [theFrame addObject:frame];
        }

        _frame = theFrame;
    }
    return self;
}


@end


@implementation EDAnimationSlotFrame

@end

@implementation EDAnimationSlot
- (instancetype)initWithJson:(NSDictionary *)json frameRate:(NSInteger)frameRate
{
    self = [super init];
    if (self) {
        _name = json[@"name"];
        
        NSArray *frameJSON = json[@"frame"];
        NSMutableArray *theFrame = [NSMutableArray arrayWithCapacity:frameJSON.count];
        NSDictionary *lastItem;
        for (NSDictionary *item in frameJSON)
        {
            EDAnimationSlotFrameColor *color = [[EDAnimationSlotFrameColor alloc] initWithJson:item[@"color"]];
            NSTimeInterval duration;
            BOOL tweenEasing;
            if(lastItem)
            {
                duration = 1.0 / (NSTimeInterval)frameRate * (NSTimeInterval)([lastItem[@"duration"] intValue]);
                tweenEasing = (lastItem[@"tweenEasing"] != nil); // if not int is no
            }
            else
            {
                duration = 0;
                tweenEasing = NO;
            }
            EDAnimationSlotFrame *frame = [EDAnimationSlotFrame new];
            frame.tweenEasing = tweenEasing;
            frame.color = color;
            frame.displayIndex = item[@"displayIndex"]?[item[@"displayIndex"] intValue]:0;
            frame.duration = duration;
            [theFrame addObject:frame];
            lastItem = item;
        }
        
        NSInteger lastDuration = [[frameJSON lastObject][@"duration"] intValue];
        if (lastDuration != 0)
        {
            EDAnimationSlotFrame *firstFrame = theFrame.firstObject;
            
            EDAnimationSlotFrame *frame = [EDAnimationSlotFrame new];
            frame.tweenEasing = NO;
            frame.color = firstFrame.color;
            frame.displayIndex = firstFrame.displayIndex;
            frame.duration = 1.0 / (NSTimeInterval)frameRate * (NSTimeInterval)lastDuration;
            [theFrame addObject:frame];
        }
        
        _frame = theFrame;
    }
    return self;
}
@end

@implementation EDAnimationFrame


@end

@implementation EDAnimation
- (instancetype)initWithJson:(NSDictionary *)json boneTransforms:(NSDictionary *)boneTransforms frameRate:(NSInteger)frameRate
{
    self = [super init];
    if (self) {
        _name = json[@"name"];
        _playTimes = [json[@"playTimes"] integerValue];
        _duration = 1.0 / (NSTimeInterval)frameRate * (NSTimeInterval)([json[@"duration"] intValue]);
        
        NSArray *slotJSON = json[@"slot"];
        NSMutableArray *theSlot = [NSMutableArray arrayWithCapacity:slotJSON.count];
        for (NSDictionary *item in slotJSON) {
            [theSlot addObject:[[EDAnimationSlot alloc] initWithJson:item frameRate:frameRate]];
        }
        _slot = theSlot;
        
        NSArray *boneJSON = json[@"bone"];
        NSMutableArray *theBone = [NSMutableArray arrayWithCapacity:boneJSON.count];
        for (NSDictionary *item in boneJSON)
        {
            [theBone addObject:[[EDAnimationBone alloc] initWithJson:item boneTransforms:boneTransforms frameRate:frameRate]];
        }
        _bone = theBone;
        
        NSArray *frameJSON = json[@"frame"];
        NSDictionary *lastItem;
        NSTimeInterval cDuration = 0;
        NSMutableArray *theFrame = [NSMutableArray arrayWithCapacity:frameJSON.count];
        for (NSDictionary *item in frameJSON)
        {
            NSTimeInterval duration;
            BOOL tweenEasing;
            NSString *event = [item[@"event"] stringValue];
            if(lastItem)
            {
                duration = 1.0 / (NSTimeInterval)frameRate * (NSTimeInterval)([lastItem[@"duration"] intValue]);
                tweenEasing = (lastItem[@"tweenEasing"] != nil); // if not int is no
            }
            else
            {
                duration = 0;
                tweenEasing = NO;
            }
            
            EDAnimationFrame *frame = [EDAnimationFrame new];
            frame.tweenEasing = tweenEasing;
            frame.event = event;
            frame.duration = duration;
            [theFrame addObject:frame];
            cDuration += duration;
            lastItem = item;
        }
        
        if (frameJSON.count != 0) {
            if (cDuration < _duration) {
                EDAnimationFrame *frame = [EDAnimationFrame new];
                frame.tweenEasing = NO;
                frame.event = nil;
                frame.duration = _duration - cDuration;
                [theFrame addObject:frame];
            }
        }
        _frame = theFrame;
        
    }
    return self;
}
@end
