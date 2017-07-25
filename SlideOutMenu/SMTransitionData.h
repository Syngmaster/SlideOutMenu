//
//  SMTransitionData.h
//  SlideOutMenu
//
//  Created by Syngmaster on 24/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMInteractor;
typedef void (^ __nullable completionSegue)(void);

@interface SMTransitionData : NSObject

- (CGFloat)calculateProgress:(CGPoint)translationInView inView:(CGRect)viewBounds withDirection:(NSInteger)direction;

- (void)mapGestureStateToInteractor:(UIGestureRecognizerState)gestureState withProgress:(CGFloat)progress andInterctor:(SMInteractor *_Nonnull)interactor onComplete:(completionSegue)completionSegue;

@end
