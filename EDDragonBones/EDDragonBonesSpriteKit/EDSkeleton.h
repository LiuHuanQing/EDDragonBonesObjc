//
//  EDSkeleton.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDArmature.h"


@interface EDSkeleton : NSObject
@property (nonatomic) NSInteger frameRate;
@property (nonatomic, strong) NSString *version;
@property (nonatomic) NSInteger isGlobal;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSMutableArray <EDArmature *> *armature;
- (instancetype)initWithJson:(NSDictionary *)json;
@end

