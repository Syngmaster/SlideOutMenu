//
//  SMMainViewController.h
//  SlideOutMenu
//
//  Created by Syngmaster on 18/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMainViewController : UIViewController

- (IBAction)openMenuAction:(UIButton *)sender;
- (IBAction)edgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender;

@end

