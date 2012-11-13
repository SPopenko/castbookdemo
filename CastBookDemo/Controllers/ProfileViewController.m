//
//  ProfileViewController.m
//  CastBookDemo
//
//  Created by Anton Poluboiarynov on 11/12/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import "ProfileViewController.h"
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
