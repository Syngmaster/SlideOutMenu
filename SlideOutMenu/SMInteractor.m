//
//  SMInteractor.m
//  SlideOutMenu
//
//  Created by Syngmaster on 24/07/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMInteractor.h"

@implementation SMInteractor

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hasStarted = NO;
        self.shouldFinish = NO;
    }
    return self;
}

@end
