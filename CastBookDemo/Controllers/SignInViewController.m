//
//  SignInViewController.m
//  CastBookDemo
//
//  Created by Anton Poluboiarynov on 11/12/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import "SignInViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface SignInViewController ()

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.loginView.layer.cornerRadius = 10.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_loginView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLoginView:nil];
    [super viewDidUnload];
}
@end
