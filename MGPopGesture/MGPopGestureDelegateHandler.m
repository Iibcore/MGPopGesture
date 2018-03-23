//
//  MGPopGestureDelegateHandler.m
//  MGPopGestureExample
//
//  Created by MANGO on 2018/3/23.
//  Copyright © 2018年 MANGO. All rights reserved.
//

#import "MGPopGestureDelegateHandler.h"

@implementation MGPopGestureDelegateHandler

- (instancetype)initWithManagerViewController:(UIViewController *)managerVC {
    self = [super init];
    if (self) {
        self.managerViewController = managerVC;
    }
    return self;
}

- (BOOL)popGesture_isRootViewController {
    return (self.managerViewController == self.managerViewController.navigationController.viewControllers.firstObject || self.managerViewController.tabBarController == self.managerViewController.navigationController.viewControllers.firstObject);
}

#pragma mark - UIGestureRecognizerDelegate - Pop手势问题

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self popGesture_isRootViewController] && [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class]) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

@end
