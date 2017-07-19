//
//  SMDismissMenuAnimator.m
//  SlideOutMenu
//
//  Created by Syngmaster on 19/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDismissMenuAnimator.h"

@implementation SMDismissMenuAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(nonnull id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *snapshot = [containerView viewWithTag:1];
    

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        snapshot.frame = CGRectMake(CGPointZero.x, CGPointZero.y, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
        
    } completion:^(BOOL finished) {
        
        
        if (![transitionContext transitionWasCancelled]) {
            [containerView insertSubview:toVC.view aboveSubview:fromVC.view];
            [snapshot removeFromSuperview];
        } 

        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

        
    }];
    
}


@end
