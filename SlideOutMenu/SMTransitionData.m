//
//  SMTransitionData.m
//  SlideOutMenu
//
//  Created by Syngmaster on 24/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMTransitionData.h"
#import "SMInteractor.h"



typedef NS_ENUM(NSInteger, Direction) {
    
    DirectionUp,
    DirectionDown,
    DirectionLeft,
    DirectionRight
    
};


@implementation SMTransitionData


- (CGFloat)calculateProgress:(CGPoint)translationInView inView:(CGRect)viewBounds withDirection:(NSInteger)direction {
    
    CGFloat pointOnAxis = 0.0;
    CGFloat axisLength = 0.0;
    
    switch (direction) {
        case DirectionUp:
            pointOnAxis = translationInView.y;
            axisLength = viewBounds.size.height;
            break;
        case DirectionDown:
            pointOnAxis = translationInView.y;
            axisLength = viewBounds.size.height;
            break;
        case DirectionRight:
            pointOnAxis = translationInView.x;
            axisLength = viewBounds.size.width;
            break;
        case DirectionLeft:
            pointOnAxis = translationInView.x;
            axisLength = viewBounds.size.width;
            break;
    }
    
    CGFloat movementOnAxis = pointOnAxis / axisLength;
    CGFloat positiveMovementOnAxis = 0.0;
    CGFloat positiveMovementOnAxisPercent = 0.0;
    
    
    switch (direction) {
            
        case DirectionRight:
            positiveMovementOnAxis = fmaxf(movementOnAxis, 0.0);
            positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0);
            return positiveMovementOnAxisPercent;
            break;
        case DirectionDown:
            positiveMovementOnAxis = fmaxf(movementOnAxis, 0.0);
            positiveMovementOnAxisPercent = fminf(positiveMovementOnAxis, 1.0);
            return positiveMovementOnAxisPercent;
            break;
        case DirectionUp:
            positiveMovementOnAxis = fminf(movementOnAxis, 0.0);
            positiveMovementOnAxisPercent = fmaxf(positiveMovementOnAxis, -1.0);
            return -positiveMovementOnAxisPercent;
            break;
        case DirectionLeft:
            positiveMovementOnAxis = fminf(movementOnAxis, 0.0);
            positiveMovementOnAxisPercent = fmaxf(positiveMovementOnAxis, -1.0);
            return -positiveMovementOnAxisPercent;
            break;
            
    }
    
    return positiveMovementOnAxisPercent;
}

- (void)mapGestureStateToInteractor:(UIGestureRecognizerState)gestureState withProgress:(CGFloat)progress andInterctor:(SMInteractor *)interactor onComplete:(completionSegue)completionSegue {
    
    switch (gestureState) {
        case UIGestureRecognizerStateBegan:
            interactor.hasStarted = YES;
            completionSegue();
            break;
        case UIGestureRecognizerStateChanged:
            interactor.shouldFinish = progress > 0.3;
            [interactor updateInteractiveTransition:progress];
            break;
        case UIGestureRecognizerStateCancelled:
            interactor.hasStarted = NO;
            [interactor cancelInteractiveTransition];
            break;
        case UIGestureRecognizerStateEnded:
            interactor.hasStarted = NO;
            interactor.shouldFinish ? [interactor finishInteractiveTransition]:
                                      [interactor cancelInteractiveTransition];
            break;
        default:
            break;

    }
    
}

@end
