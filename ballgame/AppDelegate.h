//
//  AppDelegate.h
//  ballgame
//
//  Created by Aditya Narayan on 3/25/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) LoginViewController *loginViewController;
@property (strong, nonatomic) UINavigationController *navController;

@end

