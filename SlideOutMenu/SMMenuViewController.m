//
//  SMMenuViewController.m
//  SlideOutMenu
//
//  Created by Syngmaster on 18/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMMenuViewController.h"
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
        self.interactor.hasStarted = YES;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else if (sender.state == UIGestureRecognizerStateChanged) {
        [self.interactor updateInteractiveTransition:progress];
    }
    else if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
        self.interactor.hasStarted = NO;
        if (progress > 0.1) {
            [self.interactor finishInteractiveTransition];
        }
        else {
            [self.interactor cancelInteractiveTransition];
        }
    }
}


@end
