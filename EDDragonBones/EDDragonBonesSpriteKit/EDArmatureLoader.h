//
//  EDArmatureLoader.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EDArmatureNode.h"
@interface EDArmatureLoader : NSObject
- (instancetype)initWithFilepath:(NSString *)filepath;
- (EDArmatureNode *)loadNode:(NSString *)name;
@end
