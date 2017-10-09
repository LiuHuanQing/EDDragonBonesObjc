//
//  GameScene.m
//  EDDragonBones
//
//  Created by 刘欢庆 on 2017/9/18.
//  Copyright © 2017年 刘欢庆. All rights reserved.
//

#import "GameScene.h"
#import "EDArmatureLoader.h"
@implementation GameScene {
    SKShapeNode *_spinnyNode;
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    
    // Get label node from scene and store it for use later
//    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
//    
//    _label.alpha = 0.0;
//    [_label runAction:[SKAction fadeInWithDuration:2.0]];
//    
//    CGFloat w = (self.size.width + self.size.height) * 0.05;
//    
//    // Create shape node to use during mouse interaction
//    _spinnyNode = [SKShapeNode shapeNodeWithRectOfSize:CGSizeMake(w, w) cornerRadius:w * 0.3];
//    _spinnyNode.lineWidth = 2.5;
//    
//    [_spinnyNode runAction:[SKAction repeatActionForever:[SKAction rotateByAngle:M_PI duration:1]]];
//    [_spinnyNode runAction:[SKAction sequence:@[
//                                                [SKAction waitForDuration:0.5],
//                                                [SKAction fadeOutWithDuration:0.5],
//                                                [SKAction removeFromParent],
//                                                ]]];
    
    
    
    NSString *JSONPath = [[NSBundle mainBundle] pathForResource:@"skeleton" ofType:@"json"];
    EDArmatureLoader *loader = [[EDArmatureLoader alloc] initWithFilepath:JSONPath];
    EDArmatureNode *node = [loader loadNode:@"injuredfarmer"];
    [node repeatAnimation:@"idle"];
    node.position = CGPointMake(-300, -50);
    
    [self addChild:node];

    
    NSString *JSONPath2 = [[NSBundle mainBundle] pathForResource:@"skeleton2" ofType:@"json"];
    EDArmatureLoader *loader2 = [[EDArmatureLoader alloc] initWithFilepath:JSONPath2];
    EDArmatureNode *node2 = [loader2 loadNode:@"class1_earth"];
    [node2 repeatAnimation:@"idle"];
    node2.position = CGPointMake(200, 10);
    [self addChild:node2];

    NSString *JSONPath3 = [[NSBundle mainBundle] pathForResource:@"monkey" ofType:@"json"];
    EDArmatureLoader *loader3 = [[EDArmatureLoader alloc] initWithFilepath:JSONPath3];
    EDArmatureNode *node3 = [loader3 loadNode:@"monkey_1_01"];
    [node3 repeatAnimation:@"idle"];
    node3.position = CGPointMake(300, 100);
    [self addChild:node3];

    
    
//    NSString *JSONPath2 = [[NSBundle mainBundle] pathForResource:@"Bicycle_ske" ofType:@"json"];
//    EDArmatureLoader *loader2 = [[EDArmatureLoader alloc] initWithFilepath:JSONPath2];
//    EDArmatureNode *node2 = [loader2 loadNode:@"Bicycle"];
//    [node2 repeatAnimation:@"bicycle"];
    
    

//    node2.position = CGPointMake(200, 10);
//    [self addChild:node2];

    
//    let JSONPath = Bundle.main.path(forResource: "skeleton", ofType: "json")!
//    let loader = EDArmatureLoader(filePath: JSONPath)
//    let node = loader.loadNode(named: "injuredfarmer")
//    node.repeatAnimation("idle")
//    node.position = CGPoint(x: -300, y: -50)
//    self.addChild(node)

}


- (void)touchDownAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor greenColor];
    [self addChild:n];
    
    
    SKNode *node = [self childNodeWithName:@"cirrus"];
    NSLog(@"node %@",node);
}

- (void)touchMovedToPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor blueColor];
    [self addChild:n];
}

- (void)touchUpAtPoint:(CGPoint)pos {
    SKShapeNode *n = [_spinnyNode copy];
    n.position = pos;
    n.strokeColor = [SKColor redColor];
    [self addChild:n];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    SKNode *node = [self childNodeWithName:@"cirrus"];
    NSLog(@"node %@",node);

    // Run 'Pulse' action from 'Actions.sks'
//    [_label runAction:[SKAction actionNamed:@"Pulse"] withKey:@"fadeInOut"];
    
//    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
//    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
