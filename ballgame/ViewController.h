//
//  ViewController.h
//  ballgame
//
//  Created by Aditya Narayan on 3/25/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DraggableView.h"
#import "AnimationObject.h"

@class DraggableView;

@interface ViewController : UIViewController <UIDynamicAnimatorDelegate,UICollisionBehaviorDelegate>


- (IBAction)startButton:(id)sender;
-(void) lose;

@property (weak, nonatomic) IBOutlet UIButton *start;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, retain) UIView *ball;
@property (weak, nonatomic) IBOutlet UILabel *timer;

@property (weak, nonatomic) NSTimer *gameTime;


@property (nonatomic) int x;

@property (nonatomic, retain) DraggableView *paddle;

@end

