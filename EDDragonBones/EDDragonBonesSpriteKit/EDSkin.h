//
//  EDSkin.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDTransform.h"

@interface EDSkinSlotDisplay : NSObject
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) EDTransform *transform;
@property (nonatomic, strong) NSString *name;
- (instancetype)initWithJson:(NSDictionary *)json;
@end

@interface EDSkinSlot : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray <EDSkinSlotDisplay *> *display;
- (instancetype)initWithJson:(NSDictionary *)json;
@end

@interface EDSkin : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray <EDSkinSlot *> *slot;

- (instancetype)initWithJson:(NSDictionary *)json;
@end
