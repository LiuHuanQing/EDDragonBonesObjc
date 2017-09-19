//
//  EDBone.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDTransform.h"
@interface EDBone : NSObject
@property (nonatomic, strong) EDTransform *transform;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *parent;
- (instancetype)initWithJson:(NSDictionary *)json;

@end
