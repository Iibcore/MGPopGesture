//
//  UIViewController+MGPopGesture.m
//  MGPopGestureExample
//
//  Created by MANGO on 2018/3/23.
//  Copyright © 2018年 MANGO. All rights reserved.
//

#import "UIViewController+MGPopGesture.h"
#import "MGPopGestureDelegateHandler.h"
#import <objc/runtime.h>

static void *MGUIViewControllerCustomPropertyOpenPopGesture = (void *)@"MGUINavigationControllerCustomPropertyOpenPopGesture";
static void *MGUIViewControllerCustomPropertyDelegateManager = (void *)@"MGUIViewControllerCustomPropertyDelegateManager";

@implementation UIViewController (MGPopGesture)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            Method origin_viewDidAppear = class_getInstanceMethod([self class], @selector(viewDidAppear:));
            Method swizzled_viewDidAppear = class_getInstanceMethod([self class], @selector(mg_popGesture_viewDidAppear:));
            method_exchangeImplementations(origin_viewDidAppear, swizzled_viewDidAppear);
        }
    });
}

- (void)mg_popGesture_viewDidAppear:(BOOL)animated {
    [self mg_popGesture_viewDidAppear:animated];
    if (self.mg_openPopGesture) {
        if (!self.mg_popGesture_delegateManager) {
            self.mg_popGesture_delegateManager = [[MGPopGestureDelegateHandler alloc] initWithManagerViewController:self];
        }
        self.navigationController.interactivePopGestureRecognizer.delegate = self.mg_popGesture_delegateManager;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - Getter And Setter

- (BOOL)mg_openPopGesture {
    NSNumber *number = objc_getAssociatedObject(self, MGUIViewControllerCustomPropertyOpenPopGesture);
    return [number boolValue];
}

- (void)setMg_openPopGesture:(BOOL)mg_openPopGesture {
    if (mg_openPopGesture) {
        if (self.mg_openPopGesture) {
            return;
        }
        if (!self.mg_popGesture_delegateManager) {
            self.mg_popGesture_delegateManager = [[MGPopGestureDelegateHandler alloc] initWithManagerViewController:self];
        }
        self.navigationController.interactivePopGestureRecognizer.delegate = self.mg_popGesture_delegateManager;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    } else {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    objc_setAssociatedObject(self, MGUIViewControllerCustomPropertyOpenPopGesture, @(mg_openPopGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MGPopGestureDelegateHandler *)mg_popGesture_delegateManager {
    return objc_getAssociatedObject(self, MGUIViewControllerCustomPropertyDelegateManager);
}

- (void)setMg_popGesture_delegateManager:(MGPopGestureDelegateHandler *)mg_popGesture_delegateManager {
    objc_setAssociatedObject(self, MGUIViewControllerCustomPropertyDelegateManager, mg_popGesture_delegateManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
