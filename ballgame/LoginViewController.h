//
//  LoginViewController.h
//  ballgame
//
//  Created by Aditya Narayan on 4/19/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import "ViewController.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)login:(id)sender;


@end
