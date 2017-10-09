//
//  EDSlot.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDSlot : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *parent;
@property (nonatomic) NSInteger z;
@property (nonatomic) NSInteger displayIndex;
- (instancetype)initWithJson:(NSDictionary *)json;
@end
