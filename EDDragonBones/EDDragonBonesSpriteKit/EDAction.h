//
//  EDAction.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDAction : NSObject
@property (nonatomic, strong) NSString *gotoAndPlay;
- (instancetype)initWithJson:(NSDictionary *)json;
@end
