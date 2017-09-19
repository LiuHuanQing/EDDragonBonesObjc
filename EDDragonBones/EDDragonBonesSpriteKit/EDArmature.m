//
//  EDArmature.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDArmature.h"

@implementation EDArmature
- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self) {
        
        NSMutableDictionary *boneTransforms = [NSMutableDictionary dictionary];
        
        _frameRate = json[@"frameRate"]? [json[@"frameRate"] integerValue] : 24;
        _name = json[@"name"];
        _type = json[@"type"];
        
        NSArray *boneJSON = json[@"bone"];
        NSMutableArray *theBone = [NSMutableArray arrayWithCapacity:boneJSON.count];
        for (NSDictionary *item in boneJSON)
        {
            EDBone *bone = [[EDBone alloc] initWithJson:item];
            boneTransforms[bone.name] = bone.transform;
            [theBone addObject:bone];
        }
        _bone = [theBone copy];
        
        NSArray *skinJSON = json[@"skin"];
        NSMutableArray *theSkin = [NSMutableArray arrayWithCapacity:skinJSON.count];
        for (NSDictionary *item in skinJSON)
        {
            [theSkin addObject:[[EDSkin alloc] initWithJson:item]];
        }
        _skin = [theSkin copy];
        
        NSArray *slotJSON = json[@"slot"];
        NSMutableArray *theSlot = [NSMutableArray arrayWithCapacity:slotJSON.count];
        for (NSDictionary *item in slotJSON)
        {
            [theSlot addObject:[[EDSlot alloc] initWithJson:item]];
        }
        _slot = [theSlot copy];
        
        NSArray *animationJSON = json[@"animation"];
        NSMutableArray *theAnimation = [NSMutableArray arrayWithCapacity:animationJSON.count];
        for (NSDictionary *item in animationJSON)
        {
            [theAnimation addObject:[[EDAnimation alloc] initWithJson:item boneTransforms:boneTransforms frameRate:_frameRate]];
        }
        _animation = [theAnimation copy];;
    }
    return self;
}
@end
