//
//  DraggableView.h
//  ballgame
//
//  Created by Aditya Narayan on 3/27/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "AnimationObject.h"

@class AnimationObject;
@class ViewController;

@interface DraggableView : UIView

@property (nonatomic) CGPoint lastLocation;

@property(nonatomic, strong) AnimationObject *animator;
@property (strong, nonatomic) ViewController *viewController;

@end
