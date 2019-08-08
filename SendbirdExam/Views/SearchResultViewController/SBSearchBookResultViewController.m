//
//  SBSearchBookResultViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBSearchBookResultViewController.h"
#import "UIAlertController+Utils.h"
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


- (void)refresh {
    [self requestSearch:self.searchQuery initialRequest:YES];
}

- (void)requestSearch:(NSString *)query initialRequest:(BOOL)isFirst {
    self.searchQuery = query;
    self.loading = YES;
    [self.viewModel requestSearchBookWithQuery:self.searchQuery first:isFirst completion:^(BOOL success, NSError * _Nonnull error) {
         __weak typeof(self) weakSelf = self;
        if(success) {
            [weakSelf.tableView reloadData];
        } else {
            [UIAlertController showAlert:error.localizedDescription showController:weakSelf actionBlock:^{
                __weak typeof(self) weakSelf = self;
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }];
        }
        [weakSelf.tableView.refreshControl endRefreshing];
        weakSelf.loading = NO;
    }];
//    [self.viewModel requestNewBookWithCompletion:^{
//        __weak typeof(self) weakSelf = self;
//        [weakSelf.tableView reloadData];
//    }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [self.viewModel modelCount] - 4 && !self.loading && self.viewModel.hasMoreList) {  //numberofitem count
        tableView.decelerationRate = UIScrollViewDecelerationRateFast;
        [self requestSearch:self.searchQuery initialRequest:NO];
    }
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.viewModel.modelCount;
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
