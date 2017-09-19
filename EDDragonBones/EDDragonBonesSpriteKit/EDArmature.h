//
//  EDArmature.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDAnimation.h"
#import "EDBone.h"
#import "EDSkin.h"
#import "EDSlot.h"
#import "EDAction.h"
@interface EDArmature : NSObject

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger frameRate;
@property (nonatomic, strong) NSArray<EDBone *> *bone;
@property (nonatomic, strong) NSArray<EDSkin *> *skin;
@property (nonatomic, strong) NSArray<EDSlot *> *slot;
@property (nonatomic, strong) NSArray<EDAnimation *> *animation;
@property (nonatomic, strong) NSArray<EDAction *> *defaultActions;
- (instancetype)initWithJson:(NSDictionary *)json;
@end
