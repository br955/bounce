//
//  AnimationObject.m
//  ballgame
//
//  Created by Aditya Narayan on 4/6/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import "AnimationObject.h"

@implementation AnimationObject

+(id) sharedManager {
    static AnimationObject *theManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        theManager = [[self alloc] init];
    });
    return theManager;
}

-(UIDynamicAnimator*) animateballView: (UIView*)ball paddleView: (DraggableView*)paddle view:(ViewController*)view{
    self.view = view;
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view.view];
    NSArray *collisions = [NSArray arrayWithObjects:ball, paddle, nil];
    [self startCollisionsWithObjectsInArray:collisions animator:animator];
    [self pushBall:ball animator:animator];
    [self setPropertiesForBall:ball paddle:paddle animator:animator];
    return animator;

}

-(void) startCollisionsWithObjectsInArray: (NSArray*) collisions animator:(UIDynamicAnimator*)animator{
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc]initWithItems:collisions];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate =self.view;
    
    [collisionBehavior addBoundaryWithIdentifier:@"bottom" fromPoint:CGPointMake(self.view.view.frame.origin.x, self.view.view.frame.size.height - 5) toPoint:CGPointMake(self.view.view.frame.size.width, self.view.view.frame.size.height - 5)];
    
    [animator addBehavior:collisionBehavior];
}

-(void) pushBall: (UIView*)ball animator:(UIDynamicAnimator*)animator{
    UIPushBehavior *push = [[UIPushBehavior alloc]initWithItems:@[ball] mode:UIPushBehaviorModeInstantaneous];
    float x = arc4random_uniform(2.8);
    x+=.2;
    [push setAngle:x magnitude:.2];
    [animator addBehavior:push];
}

-(void) setPropertiesForBall: (UIView*)ball paddle:(DraggableView*)paddle animator:(UIDynamicAnimator*)animator{
    UIDynamicItemBehavior *paddleProperties = [[UIDynamicItemBehavior alloc]initWithItems:@[paddle]];
    paddleProperties.allowsRotation = NO;
    paddleProperties.density = 10000.0f;
    [animator addBehavior:paddleProperties];
    
    UIDynamicItemBehavior *ballProperties = [[UIDynamicItemBehavior alloc]initWithItems:@[ball]];
    ballProperties.elasticity = 1.1;
    ballProperties.friction = 0;
    ballProperties.resistance = 0;
    [animator addBehavior:ballProperties];
}

-(void) updatePaddle: (DraggableView*)paddle{
    [self.view.animator updateItemUsingCurrentState:paddle];
}



@end









