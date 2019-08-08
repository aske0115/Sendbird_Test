//
//  UIAlertController+UtilsViewController.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 08/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Util)
+ (void)showAlert:(NSString *)message showController:(UIViewController *)viewController actionBlock:(void(^)(void))actions;
@end

NS_ASSUME_NONNULL_END
