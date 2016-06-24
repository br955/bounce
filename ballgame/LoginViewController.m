//
//  LoginViewController.m
//  ballgame
//
//  Created by Aditya Narayan on 4/19/16.
//  Copyright © 2016 TURN TO TECH. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)login:(id)sender {
    NSString *userpass = [self.username.text stringByAppendingString:self.password.text];
    
    NSString *urlString = @"http://ec2-54-165-61-69.compute-1.amazonaws.com:8080/ballgameLogin/Greeting.jsp";
    NSString *post = [NSString stringWithFormat:@"user=%@&pass=%@",self.username.text, self.password.text];
    
    NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    request.HTTPMethod = @"POST";
    request.HTTPBody = postData;
    request.URL = url;
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSString *dataString = [NSString stringWithUTF8String:[data bytes]];
        
        dispatch_async(dispatch_get_main_queue(),^{
            if( [dataString isEqualToString:@"yes" ]){
                NSLog(@"hi ben");
                ViewController *gameview = [[ViewController alloc]initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
                [self.navigationController pushViewController:gameview animated:YES];
            }
            else{
                NSLog(@"no");
                ViewController *gameview = [[ViewController alloc]initWithNibName:@"ViewController" bundle:[NSBundle mainBundle]];
                [self.navigationController pushViewController:gameview animated:YES]; // temporary addition so it pushes to game view no matter the server response.
            }
        });
        
    }];
    [task resume];
    
}
@end
