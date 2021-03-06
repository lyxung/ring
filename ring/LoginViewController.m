//
//  LoginViewController.m
//  ring
//
//  Created by Steven on 13-4-8.
//  Copyright (c) 2013年 Steven. All rights reserved.
//

#import "LoginViewController.h"
#import "Ext.h"
#import "LoginUITextField.h"
#import "registerViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>{
    LoginUITextField *txtUsername;
    LoginUITextField *txtPassword;
}

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) onLoginClick:(UITapGestureRecognizer *) sender{
        NSLog(@"onLoginClick called");
    
    /*NSURL *url = [[NSURL alloc] initWithString:@"http://ring.bingwenshi.com/login"];
     
     
     NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys: txtUsername.text, @"email",
     txtPassword.text, @"password", nil];
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
     
     NSError *error;
     NSData *postData = [NSJSONSerialization dataWithJSONObject:data options:0 error:&error];
     
     [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
     [request setHTTPMethod:@"POST"];
     [request setHTTPBody:postData];
     
     NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
     [connection start];*/
    //http request
}


-(void) onSigninClick:(UIGestureRecognizer *) sender{
    NSLog(@"method called");
    registerViewController *registerView = [[registerViewController alloc] init];
    [registerView.view  setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    NSLog(@"registerView initialized");
    
    UINavigationController *navi = [[UINavigationController alloc]init];
    [navi pushViewController:registerView animated:YES];
    NSLog(@"view navigated");
    /*
     
     [self.view.window addSubview:registerView.view];
     */
    
}
- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
    
    [txtUsername setDelegate:self];
    [txtPassword setDelegate:self];
    
    UIImage *bgImage = [UIImage imageNamed:@"bg.jpg"];
    if ([Ext checkIphone5]) {
        bgImage = [UIImage imageNamed:@"5bg.jpg"];
    }
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    [bgView setFrame:CGRectMake(0, 0, [Ext screenSize].width, [Ext screenSize].height)];
    
    [self.view addSubview:bgView];
    
    UIImageView *userBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user.png"]];
    UIImageView *passwordBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password.png"]];
    
    [userBg setFrame:CGRectMake(0, 0, 140, 26)];
    [passwordBg setFrame:CGRectMake(0, 0, 140, 26)];
    
    [userBg setCenter:CGPointMake(108,  [Ext screenSize].height/2 - 32)];
    [passwordBg setCenter:CGPointMake(108, [Ext screenSize].height/2 -6)];
    
    [self.view addSubview:userBg];
    [self.view addSubview:passwordBg];

    
    txtUsername = [[LoginUITextField alloc] init];
    txtPassword = [[LoginUITextField alloc] init];
    
    
    [txtUsername setPlaceholder:@"Email/Username"]; 
    [txtPassword setPlaceholder:@"Password"];
    [txtPassword setSecureTextEntry:YES];
    
    txtUsername.font = [UIFont fontWithName:@"Arial" size:12.0f];
    txtPassword.font = [UIFont fontWithName:@"Arial" size:12.0f];
    txtUsername.textColor = [UIColor blackColor];
    txtPassword.textColor = [UIColor blackColor];
    txtUsername.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtUsername.returnKeyType =UIReturnKeyNext;
    
    
    
    
    txtPassword.clearsOnBeginEditing = YES;
    
    txtUsername.alpha = 0.5;
    txtPassword.alpha = 0.5;
    
    [txtUsername setFrame:CGRectMake(0, 0, 110, 26)];
    [txtPassword setFrame:CGRectMake(0, 0, 110, 26)];
    
    [txtUsername setCenter:CGPointMake(110,  [Ext screenSize].height/2-31)];
    [txtPassword setCenter:CGPointMake(110,  [Ext screenSize].height/2 -6)];
    
    
    [self.view addSubview:txtUsername];
    [self.view addSubview:txtPassword];
    
    
    // The Problem
    UIImageView *loginBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginBtn.png"]];
    [loginBtn setFrame:CGRectMake(0, 0, 40, 40)];
    [loginBtn setCenter:CGPointMake([Ext screenSize].width - 60, [Ext screenSize].height/2 - 24)];
    [loginBtn setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onLoginClick:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [loginBtn addGestureRecognizer:singleTap];
    [singleTap release];
    NSLog(@"click gesture added");
    [self.view addSubview:loginBtn];
    
    
    UIImageView *signInBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"signin.png"]];
    [signInBtn setFrame:CGRectMake(0, 0, 32, 32)];
    [signInBtn setCenter:CGPointMake([Ext screenSize].width - 64, [Ext screenSize].height/2 + 10)];
    
    
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onSigninClick:)];
    singleTap2.numberOfTapsRequired = 1;
    singleTap2.numberOfTouchesRequired = 1;
    [signInBtn addGestureRecognizer:singleTap2];
    [signInBtn setUserInteractionEnabled:YES];
    [self.view addSubview:signInBtn];
                                    
    	// Do any additional setup after loading the view.
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];
}




    
- (void)connection:(NSURLConnection*) connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Response recieved");
    
}

- (void)connection:(NSURLConnection*) connection didReceiveData:(NSData *)data
{
    NSLog(@"Data recieved");
    
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidUnload{
    
    
    [super viewDidUnload];
    
    
}

-(void)viewWillUnload{
    [super viewWillUnload];
    
    [self.view removeFromSuperview];
}

@end
