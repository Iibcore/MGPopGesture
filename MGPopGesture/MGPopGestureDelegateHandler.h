//
//  MGPopGestureDelegateHandler.h
//  MGPopGestureExample
//
//  Created by MANGO on 2018/3/23.
//  Copyright © 2018年 MANGO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MGPopGestureDelegateHandler : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UIViewController *managerViewController;

- (instancetype)initWithManagerViewController:(UIViewController *)managerVC;

@end
