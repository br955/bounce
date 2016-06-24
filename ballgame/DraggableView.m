//
//  DraggableView.m
//  ballgame
//
//  Created by Aditya Narayan on 3/27/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import "DraggableView.h"

@implementation DraggableView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(detectPan:)];
        self.gestureRecognizers = @[panRecognizer];
        
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void) detectPan:(UIPanGestureRecognizer *) uiPanGestureRecognizer
{
    CGPoint translation = [uiPanGestureRecognizer translationInView:self.superview];
    self.center = CGPointMake(self.lastLocation.x + translation.x,
                              self.lastLocation.y);
    [self.animator updatePaddle:self];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Promote the touched view
    [self.superview bringSubviewToFront:self];
    
    // Remember original location
    self.lastLocation = self.center;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
