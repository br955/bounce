//
//  AnimationObject.h
//  ballgame
//
//  Created by Aditya Narayan on 4/6/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DraggableView.h"
#import "ViewController.h"
#include <stdlib.h>

@class ViewController;
@class DraggableView;

@interface AnimationObject : NSObject

+(id) sharedManager;

-(UIDynamicAnimator*) animateballView: (UIView*)ball paddleView: (DraggableView*)paddle view:(ViewController*)view;

-(void) startCollisionsWithObjectsInArray: (NSArray*) collisions animator:(UIDynamicAnimator*)animator;

-(void) pushBall: (UIView*)ball animator:(UIDynamicAnimator*)animator;

-(void) setPropertiesForBall: (UIView*)ball paddle:(DraggableView*)paddle animator:(UIDynamicAnimator*)animator;
-(void) updatePaddle:(DraggableView*)paddle;

@property (nonatomic, retain) ViewController *view;


@end
