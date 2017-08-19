////
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
#import "SMInteractor.h"


typedef NS_ENUM(NSInteger, Direction) {
    
    DirectionUp,
    DirectionDown,
    DirectionLeft,
    DirectionRight
    
};

@interface SMMainViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) SMInteractor *interactor;

@end

@implementation SMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactor = [[SMInteractor alloc] init];

}

- (IBAction)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender {

    CGFloat progress = [sender translationInView:self.view].x / (self.view.frame.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.interactor.hasStarted = YES;
        [self performSegueWithIdentifier:@"showMenu" sender:nil];
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.interactor updateInteractiveTransition:progress];
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        self.interactor.hasStarted = NO;
        if (progress > 0.4) {
            [self.interactor finishInteractiveTransition];
        }
        else {
            [self.interactor cancelInteractiveTransition];
        }
    } else if (sender.state == UIGestureRecognizerStateCancelled) {
        self.interactor.hasStarted = NO;
        [self.interactor cancelInteractiveTransition];
    }
    
}

- (IBAction)openMenuAction:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"showMenu" sender:sender];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SMMenuViewController *dvc = segue.destinationViewController;
    dvc.transitioningDelegate = self;
    dvc.interactor = self.interactor;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[SMPresentMenuAnimator alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[SMDismissMenuAnimator alloc] init];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interactor.hasStarted ? self.interactor : nil;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interactor.hasStarted ? self.interactor : nil;
}



@end
