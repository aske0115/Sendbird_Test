//
//  SBSearchBookResultViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBSearchBookResultViewController.h"

@interface SBSearchBookResultViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSString *searchQuery;
@property (nonatomic, assign) BOOL loading;
@end

@implementation SBSearchBookResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loading = YES;
    [self.navigationItem setLargeTitleDisplayMode:UINavigationItemLargeTitleDisplayModeNever];
}

- (void)requestSearch:(NSString *)query {
    self.searchQuery = query;
    [self.viewModel requestSearchBookWithQuery:self.searchQuery first:YES completion:^{
         __weak typeof(self) weakSelf = self;
        [weakSelf.tableView reloadData];
        self.loading = NO;
    }];
//    [self.viewModel requestNewBookWithCompletion:^{
//        __weak typeof(self) weakSelf = self;
//        [weakSelf.tableView reloadData];
//    }];
}

- (void)loadMore {
    self.loading = YES;
    [self.viewModel requestSearchBookWithQuery:self.searchQuery first:NO completion:^{
        __weak typeof(self) weakSelf = self;
        [weakSelf.tableView reloadData];
        self.loading = NO;
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [self.viewModel modelCount] - 4 && !self.loading && self.viewModel.hasMoreList) {  //numberofitem count
        tableView.decelerationRate = UIScrollViewDecelerationRateFast;
        [self loadMore];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
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
