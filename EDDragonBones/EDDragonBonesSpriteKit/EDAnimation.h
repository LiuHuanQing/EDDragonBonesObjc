//
//  EDAnimation.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDTransform.h"
@interface EDAnimationBoneFrame : NSObject
@property (nonatomic) BOOL tweenEasing;
@property (nonatomic, strong) EDTransform *transform;
@property (nonatomic) NSTimeInterval duration;
@end

@interface EDAnimationBone : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<EDAnimationBoneFrame *> *frame;
- (instancetype)initWithJson:(NSDictionary *)json boneTransforms:(NSDictionary *)boneTransforms frameRate:(NSInteger)frameRate;

@end

@interface EDAnimationSlotFrameColor : NSObject
@property (nonatomic) CGFloat alpha;
- (instancetype)initWithJson:(NSDictionary *)json;
@end

@interface EDAnimationSlotFrame : NSObject
@property (nonatomic) BOOL tweenEasing;
@property (nonatomic, strong) EDAnimationSlotFrameColor *color;
@property (nonatomic) NSInteger displayIndex;
@property (nonatomic) NSTimeInterval duration;

@end

@interface EDAnimationSlot : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<EDAnimationSlotFrame *> *frame;
- (instancetype)initWithJson:(NSDictionary *)json frameRate:(NSInteger)frameRate;
@end

@interface EDAnimationFrame : NSObject
@property (nonatomic) BOOL tweenEasing;
@property (nonatomic, strong) NSString *event;
@property (nonatomic) NSTimeInterval duration;

@end

@interface EDAnimation : NSObject
@property (nonatomic) NSInteger playTimes;
@property (nonatomic, strong) NSArray<EDAnimationSlot *> *slot;
@property (nonatomic, strong) NSArray<EDAnimationBone *> *bone;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray<EDAnimationFrame *> *frame;
- (instancetype)initWithJson:(NSDictionary *)json boneTransforms:(NSDictionary *)boneTransforms frameRate:(NSInteger)frameRate;
@end
