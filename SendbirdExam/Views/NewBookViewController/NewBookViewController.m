//
//  FirstViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 29/07/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "NewBookViewController.h"
#import "SBAPIManager.h"
#import "SBRequestQuery.h"
#import "SBBaseBookTableViewCell.h"
#import "UIAlertController+Utils.h"

@interface NewBookViewController ()
@end

@implementation NewBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [self setExtendedLayoutIncludesOpaqueBars:YES];
    // Do any additional setup after loading the view.
    [self requestAPI];
}

- (void)refresh {
    [self requestAPI];
}

- (void)requestAPI {
    [self.viewModel requestNewBookWithCompletion:^(BOOL success, NSError * _Nonnull error) {
        __weak typeof(self) weakSelf = self;
        if(success) {
            [weakSelf.tableView reloadData];
        } else {
            [UIAlertController showAlert:error.localizedDescription showController:weakSelf actionBlock:^{
                
            }];
        }
        [weakSelf.tableView.refreshControl endRefreshing];
       
    }];
}


@end
