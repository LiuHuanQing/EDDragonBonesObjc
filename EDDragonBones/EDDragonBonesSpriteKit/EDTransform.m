//
//  EDTransform.m
//  BowmastersDemo
//
//  Created by 刘欢庆 on 2017/9/17.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "EDTransform.h"

@implementation EDTransform


- (instancetype)initWithScx:(CGFloat)scX scY:(CGFloat)scY zRotation:(CGFloat)zRotation position:(CGPoint)position
{
    self = [super init];
    if (self) {
        _scX = scY;
        _scY = scY;
        _zRotation = zRotation;
        _position = position;
    }
    return self;
}

- (instancetype)initWithJson:(NSDictionary *)json
{
    self = [super init];
    if (self)
    {
        float skX =  json[@"skX"]?[json[@"skX"] floatValue]:0;
        float skY =  json[@"skY"]?[json[@"skY"] floatValue]:0;
        float x =  json[@"x"]?[json[@"x"] floatValue]:0;
        float y =  -(json[@"y"]?[json[@"y"] floatValue]:0);
        _scX =  json[@"scX"]?[json[@"scX"] floatValue]:1;
        _scY =  json[@"scY"]?[json[@"scY"] floatValue]:1;
        _zRotation = -(((skX + skY) / 2.0 ) * M_PI / 180.0);
        _position = CGPointMake(x, y);
        
    }
    return self;
}

- (instancetype)initWithJson:(NSDictionary *)json defaultTransform:(EDTransform *)defaultTransform
{
    self = [super init];
    if (self) {
        float offsetSkX = json[@"skX"]?[json[@"skX"] floatValue] : 0;
        float offsetSkY = json[@"skY"]?[json[@"skY"] floatValue] : 0;
        
        float offsetX = json[@"x"]? [json[@"x"] floatValue] : 0;
        float offsetY = -(json[@"y"]? [json[@"y"] floatValue] : 0);
        
        CGFloat offsetScX = json[@"scX"]? [json[@"scX"] floatValue] : 1;
        CGFloat offsetScY = -(json[@"scY"]? [json[@"scY"] floatValue] : 1);
        CGFloat offsetZRotation = -((offsetSkX + offsetSkY) / 2 ) * M_PI / 180.0f;

        _scX = defaultTransform.scX * offsetScX;
        _scY = defaultTransform.scY * offsetScY;
        _zRotation = defaultTransform.zRotation + offsetZRotation;
        _position = CGPointMake(defaultTransform.position.x + offsetX, defaultTransform.position.y + offsetY);

    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"EDTransform { scX:%f, scY:%f, zRotation:%f, p.x:%f p.y:%f}",_scX,_scY,_zRotation,_position.x,_position.y];
}
@end
