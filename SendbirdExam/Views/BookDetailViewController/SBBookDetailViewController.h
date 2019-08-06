//
//  SBBookDetailViewController.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBBookDetailViewController : UIViewController
- (void)requestDetail:(NSString *)isbn13;
@end

NS_ASSUME_NONNULL_END
