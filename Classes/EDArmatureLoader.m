//
//  EDArmatureLoader.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDArmatureLoader.h"
#import "EDSkeleton.h"

@interface EDArmatureLoader()
@property (nonatomic, strong) NSMutableDictionary *armatureConfig;
@end


@implementation EDArmatureLoader
- (instancetype)initWithFilepath:(NSString *)filepath
{
    self = [super init];
    if (self) {
        _armatureConfig = [NSMutableDictionary dictionary];
        NSData *JSONData = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:filepath]];
        NSError *error;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:JSONData options:kNilOptions error:&error];
        
        EDSkeleton *skeleton = [[EDSkeleton alloc] initWithJson:json];
        for (EDArmature *armature in skeleton.armature)
        {
            _armatureConfig[armature.name] = armature;
        }
        
    }
    return self;
}

- (EDArmatureNode *)loadNode:(NSString *)name
{
    return [self loadRequireArmature:name];
}

- (EDArmatureNode *)loadRequireArmature:(NSString *)name
{
    return [[EDArmatureNode alloc] initWithArmature:_armatureConfig[name] loader:self];
}


@end
