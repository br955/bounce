//
//  ViewController.m
//  ballgame
//
//  Created by Aditya Narayan on 3/25/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.frame = [[UIScreen mainScreen]bounds];
   
    // Do any additional setup after loading the view, typically from a nib.
    self.ball = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 100, 24, 24)];
    self.ball.layer.cornerRadius = self.ball.bounds.size.width/2;
    self.ball.layer.masksToBounds = YES;
    self.ball.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.ball];
    
    self.paddle = [[DraggableView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height - 30, 70, 10)];
    [self.view addSubview:self.paddle];
    self.paddle.animator = [AnimationObject sharedManager];
    
    self.x = 0;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initAnimation {

    self.animator.delegate = self;
    
    self.gameTime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    self.animator = [[AnimationObject sharedManager]animateballView:self.ball paddleView:self.paddle view: self];
}

-(void) updateTimer {
    self.x++;
    self.timer.text = [NSString stringWithFormat: @"%d", self.x ];
}

-(void) lose {
    [self.animator removeAllBehaviors];
     self.ball.center = CGPointMake(self.view.frame.size.width/2, 100);
    self.start.alpha = 1;
    if (self.gameTime){
        [self.gameTime invalidate];
        self.gameTime = nil;
    }
    self.x = 0;
}

- (IBAction)startButton:(id)sender {
    [self initAnimation];
    self.start.alpha = 0;
    self.timer.text = 0;
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    NSString *ident = [NSString stringWithFormat:@"%@",identifier];
    if ([ident isEqualToString: @"bottom"]) {
        [self lose];
    }
}
@end







