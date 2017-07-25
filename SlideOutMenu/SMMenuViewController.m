//
//  SMMenuViewController.m
//  SlideOutMenu
//
//  Created by Syngmaster on 18/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMMenuViewController.h"
#import "SMTransitionData.h"
#import "SMInteractor.h"

@interface SMMenuViewController ()

@end

@implementation SMMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (IBAction)dismissAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)handleGesture:(UIPanGestureRecognizer *)sender {
    
    CGFloat progress = [sender translationInView:self.view].x / (self.view.frame.size.width * 1.0);
    progress = MAX(0.0, fabs(progress));
    progress = MIN(1.0, progress);
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.interactiveTransition updateInteractiveTransition:progress];
    }
    else if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.1) {
            [self.interactiveTransition finishInteractiveTransition];
        }
        else {
            [self.interactiveTransition cancelInteractiveTransition];
        }
        self.interactiveTransition = nil;
    }
}


@end
