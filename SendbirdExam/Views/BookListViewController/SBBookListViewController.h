//
//  SBBookListViewController.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookViewModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol SBBookListViewControllerDelegate
@required
- (void)refresh;
@end

@interface SBBookListViewController : UIViewController <SBBookListViewControllerDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SBBookViewModel *viewModel;
@end

NS_ASSUME_NONNULL_END
