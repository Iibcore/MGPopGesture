//
//  UINavigationController+MGPopGesture.m
//  MGPopGestureExample
//
//  Created by MANGO on 2018/3/23.
//  Copyright © 2018年 MANGO. All rights reserved.
//

#import "UINavigationController+MGPopGesture.h"
#import <objc/runtime.h>

@implementation UINavigationController (MGPopGesture)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            Method origin_pushViewController_animated = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
            Method swizzled_pushViewController_animated = class_getInstanceMethod([self class], @selector(popGesture_pushViewController:animated:));
            method_exchangeImplementations(origin_pushViewController_animated, swizzled_pushViewController_animated);
        }
    });
}

- (void)popGesture_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.interactivePopGestureRecognizer.enabled = NO;
    [self popGesture_pushViewController:viewController animated:animated];
}

@end
