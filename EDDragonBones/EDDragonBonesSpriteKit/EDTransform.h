//
//  EDTransform.h
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import <CoreGraphics/CGGeometry.h>

@interface EDTransform : NSObject
@property (nonatomic) CGFloat scX;
@property (nonatomic) CGFloat scY;
@property (nonatomic) CGFloat zRotation;
@property (nonatomic) CGPoint position;


- (instancetype)initWithJson:(NSDictionary *)json;
- (instancetype)initWithJson:(NSDictionary *)json defaultTransform:(EDTransform *)defaultTransform;
- (instancetype)initWithScx:(CGFloat)scX scY:(CGFloat)scY zRotation:(CGFloat)zRotation position:(CGPoint)position;
@end
