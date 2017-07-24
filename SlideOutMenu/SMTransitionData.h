//
//  SMTransitionData.h
//  SlideOutMenu
//
//  Created by Syngmaster on 24/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTransitionData : NSObject

- (CGFloat)calculateProgress:(CGPoint)translationInView inView:(CGRect)viewBounds withDirection:(NSInteger)direction;

@end
