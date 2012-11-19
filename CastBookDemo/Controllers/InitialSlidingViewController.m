//
//  InitialSlidingViewController.m
//  CastBookDemo
//
//  Created by Anton Poluboiarynov on 11/12/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import "InitialSlidingViewController.h"

@interface InitialSlidingViewController ()

@end

@implementation InitialSlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTintColor:[UIColor brownColor]];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Demo reelTop"];
}

@end
