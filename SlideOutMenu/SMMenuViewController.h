//
//  SMMenuViewController.h
//  SlideOutMenu
//
//  Created by Syngmaster on 18/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMInteractor.h"

@interface SMMenuViewController : UIViewController

@property (strong, nonatomic) SMInteractor *interactor;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

- (IBAction)dismissAction:(UIButton *)sender;

@end
