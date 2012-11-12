//
//  MessagesViewController.m
//  CastBookDemo
//
//  Created by Anton Poluboiarynov on 11/12/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import "MessagesViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.slidingViewController != nil) {
        if (![self.slidingViewController.underLeftViewController isKindOfClass:[MenuViewController class]]) {
            self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
        }
        self.slidingViewController.underRightViewController = nil;
        self.slidingViewController.anchorLeftPeekAmount     = 0;
        self.slidingViewController.anchorLeftRevealAmount   = 0;
        
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
        
    }
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
