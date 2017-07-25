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
#import "SMTransitionData.h"


typedef NS_ENUM(NSInteger, Direction) {
    
    DirectionUp,
    DirectionDown,
    DirectionLeft,
    DirectionRight
    
};

@interface SMMainViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation SMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender {

    CGFloat progress = [sender translationInView:self.view].x / (self.view.frame.size.width * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self performSegueWithIdentifier:@"showMenu" sender:nil];
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.interactiveTransition updateInteractiveTransition:progress];
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        if (progress > 0.4) {
            [self.interactiveTransition finishInteractiveTransition];
        }
        else {
            [self.interactiveTransition cancelInteractiveTransition];
        }
        self.interactiveTransition = nil;
    } else if (sender.state == UIGestureRecognizerStateCancelled) {
        [self.interactiveTransition cancelInteractiveTransition];
    }
    
}

- (IBAction)openMenuAction:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"showMenu" sender:sender];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SMMenuViewController *dvc = segue.destinationViewController;
    dvc.transitioningDelegate = self;
}


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[SMPresentMenuAnimator alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[SMDismissMenuAnimator alloc] init];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveTransition;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interactiveTransition;
}



@end
