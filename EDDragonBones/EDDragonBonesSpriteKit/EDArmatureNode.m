//
//  EDArmatureNode.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDArmatureNode.h"
#import "EDTransform.h"
#import "SKNode+EDBone.h"

#import "EDSlotNode.h"
#import "EDSkin.h"
#import "EDDisplayNode.h"
#import "EDArmatureLoader.h"
#import "SKAction+EDAdd.h"
@interface EDArmatureNode()
@property (nonatomic, strong) NSMutableDictionary *boneAnimationDictionary;
@property (nonatomic, strong) NSMutableDictionary *slotAnimationDictionary;
@property (nonatomic, strong) NSMutableDictionary *frameAnimationDictionary;
@property (nonatomic, strong) NSMutableDictionary *boneDictionary;
@property (nonatomic, strong) NSMutableDictionary *slotDictionary;
@property (nonatomic, strong) NSMutableArray *childArmatureNodes;
@end

@implementation EDArmatureNode
- (instancetype)initWithArmature:(EDArmature *)armature loader:(EDArmatureLoader *)loader
{
    self = [self initWithArmature:armature loader:loader transform:nil];
    if (self)
    {
        
    }
    return self;
}

- (instancetype)initWithArmature:(EDArmature *)armature loader:(EDArmatureLoader *)loader transform:(EDTransform *)transform
{
    self = [super init];
    if (self)
    {
        _boneAnimationDictionary = [NSMutableDictionary dictionary];
        _slotAnimationDictionary = [NSMutableDictionary dictionary];
        _frameAnimationDictionary = [NSMutableDictionary dictionary];
        _boneDictionary = [NSMutableDictionary dictionary];
        _slotDictionary = [NSMutableDictionary dictionary];
        _childArmatureNodes = [NSMutableArray array];
        
        if(transform)
        {
            self.transform = transform;
        }
        self.name = armature.name;

        for (EDBone *bone in armature.bone)
        {
            SKNode *boneNode = [[SKNode alloc] initWithBone:bone];
            SKNode *parentNode = nil;
            NSString *parentName = bone.parent;
            
            if (parentName)
            {
                parentNode = _boneDictionary[parentName];
            }
            else
            {
                parentNode = self;
            }
            [parentNode addChild:boneNode];
            _boneDictionary[bone.name] = boneNode;
        }
        
        for (EDSlot *slot in armature.slot)
        {
            EDSlotNode *slotNode = [[EDSlotNode alloc] initWithSlot:slot];
            SKNode *parentNode = _boneDictionary[slot.parent];
            [parentNode addChild:slotNode];
            _slotDictionary[slot.name] = slotNode;
        }
        
        for (EDSkin *skin in armature.skin)
        {
            for (EDSkinSlot *slot in skin.slot)
            {
                SKNode *node = _slotDictionary[slot.name];
                for (int i = 0; i < slot.display.count; i++)
                {
                    EDSkinSlotDisplay *display = slot.display[i];
                    if([display.type isEqualToString:@"image"])
                    {
                        NSArray *components = [display.name componentsSeparatedByString:@"/"];
                        NSString *atlasName = components[0];
                        NSString *textureName = [components[1] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
                        SKTextureAtlas *atlas = [SKTextureAtlas atlasNamed:atlasName];
                        SKTexture *texture = [atlas textureNamed:textureName];
                        EDDisplayNode *spriteNode = [[EDDisplayNode alloc] initWithTransform:display.transform texture:texture];
                        [node addChild:spriteNode];
                    }
                    else if([display.type isEqualToString:@"armature"])
                    {
                        EDArmatureNode *armatureNode = [loader loadNode:display.name];
                        armatureNode.transform = display.transform;
                        [node addChild:armatureNode];
                        [_childArmatureNodes addObject:armatureNode];
                    }
                }
            }
        }
        
        
        for (EDAnimation *animation in armature.animation)
        {
            _boneAnimationDictionary[animation.name] = [NSMutableDictionary dictionary];
            _slotAnimationDictionary[animation.name] = [NSMutableDictionary dictionary];
            
            for (EDAnimationBone *bone in animation.bone)
            {
                SKAction *action = [SKAction boneFrameAction:bone.frame duration:animation.duration];
                
                _boneAnimationDictionary[animation.name][bone.name] = action;
            }
            
            for (EDAnimationSlot *slot in animation.slot)
            {
                SKAction *action = [SKAction slotFrameAction:slot.frame duration:animation.duration];
                _slotAnimationDictionary[animation.name][slot.name] = action;

            }
            NSMutableArray *frameActionArray = [NSMutableArray arrayWithCapacity:animation.frame.count];
            for (EDAnimationFrame *frame in animation.frame)
            {
                [frameActionArray addObject:frame];
                NSString *event = frame.event;
                if (event)
                {
                    [frameActionArray addObject:[SKAction playSoundFileNamed:event waitForCompletion:NO]];
                }
            }
            
            _frameAnimationDictionary[animation.name] = [SKAction sequence:frameActionArray];
        }
    }
    return self;
}

- (void)stopAllAction
{
    for (SKNode *node in self.boneDictionary.allValues)
    {
        [node removeAllActions];
    }
    
    for (SKNode *node in self.self.slotDictionary.allValues)
    {
        [node removeAllActions];
    }
    for (EDArmatureNode *armatureNode in self.childArmatureNodes)
    {
        [armatureNode stopAllAction];
    }
    
}

- (void)repeatAnimation:(NSString *)name
{
    [self stopAllAction];
    NSMutableDictionary *animation;
    animation = self.boneAnimationDictionary[name];
    if (animation)
    {
        for (SKNode *node in self.boneDictionary.allValues)
        {
            SKAction *action = animation[node.name];
            if (action)
            {
                [node runAction:[SKAction repeatActionForever:action]];
            }
        }
    }
    
    animation = self.slotAnimationDictionary[name];
    if (animation)
    {
        for (SKNode *node in self.slotDictionary.allValues)
        {
            SKAction *action = animation[node.name];
            if (action)
            {
                [node runAction:[SKAction repeatActionForever:action]];
            }
        }
    }
    
    SKAction *action = self.frameAnimationDictionary[name];
    if (action)
    {
        [self runAction:action];
    }
    
    for (EDArmatureNode *armatureNode in self.childArmatureNodes)
    {
        [armatureNode repeatAnimation:name];
    }
    
}

- (void)playAnimation
{
    
}
@end
