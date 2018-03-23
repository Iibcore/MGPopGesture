//
//  UIViewController+MGPopGesture.h
//  MGPopGestureExample
//
//  Created by MANGO on 2018/3/23.
//  Copyright © 2018年 MANGO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (MGPopGesture) <UIGestureRecognizerDelegate>

/**
 *  设置 UIViewController 是否允许侧滑返回, default NO.
 */
@property (nonatomic, assign) BOOL mg_openPopGesture;

@end
