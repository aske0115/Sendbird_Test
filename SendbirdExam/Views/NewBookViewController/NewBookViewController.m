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


@interface NewBookViewController ()
@end

@implementation NewBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestAPI];
}

- (void)requestAPI {
    [self.viewModel requestNewBookWithCompletion:^{
        __weak typeof(self) weakSelf = self;
        [weakSelf.tableView reloadData];
    }];
}


@end
