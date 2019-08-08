//
//  UIAlertController+UtilsViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 08/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "UIAlertController+Utils.h"


@implementation UIAlertController (Util)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)showAlert:(NSString *)message showController:(UIViewController *)viewController actionBlock:(void(^)(void))actions {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        actions();
    }];
    [controller addAction:confirm];
    [viewController presentViewController:controller animated:YES completion:^{
        
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
