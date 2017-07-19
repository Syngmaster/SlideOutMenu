//
//  SMMainViewController.m
//  SlideOutMenu
//
//  Created by Syngmaster on 18/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMMainViewController.h"
#import "SMPresentMenuAnimator.h"
#import "SMMenuViewController.h"
#import "SMDismissMenuAnimator.h"

@interface SMMainViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation SMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (IBAction)openMenuAction:(UIButton *)sender {
    
    SMMenuViewController *menuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SMMenuViewController"];
    menuVC.transitioningDelegate = self;
    [self presentViewController:menuVC animated:YES completion:nil];
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[SMPresentMenuAnimator alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[SMDismissMenuAnimator alloc] init];
}



@end
