//
//  FirstViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 29/07/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "NewBookViewController.h"
#import "SBAPIManager.h"
#import "SBNewBookViewModel.h"
#import "SBRequestQuery.h"
#import "SBBaseBookTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "SBBookDetailViewController.h"

@interface NewBookViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SBNewBookViewModel *viewModel;
@end

@implementation NewBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

    [self setUp];
    [self requestAPI];
}

- (void)setUp {
    
    self.viewModel = [[SBNewBookViewModel alloc] init];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)requestAPI {
    [self.viewModel requestNewBookWithCompletion:^{
        __weak typeof(self) weakSelf = self;
        [weakSelf.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SBBaseBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell" forIndexPath:indexPath];
    
    cell.titleLabel.text = [self.viewModel title:indexPath];
    cell.subtitleLabel.text = [self.viewModel subTitle:indexPath];
    cell.priceLabel.text = [self.viewModel price:indexPath];
    [cell.thumbnailImageView setImageWithURL:[self.viewModel thumbNailURL:indexPath]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SBBookDetailViewController *detailController = [[UIStoryboard storyboardWithName:@"SBBookDetailViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    [detailController loadViewIfNeeded];
    [detailController requestDetail:[self.viewModel isbn13:indexPath]];
    detailController.title = [self.viewModel title:indexPath];
    
    [self.navigationController pushViewController:detailController animated:YES];
    
    
//
}
@end
