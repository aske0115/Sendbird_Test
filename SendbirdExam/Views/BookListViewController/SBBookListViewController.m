//
//  SBBookListViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookListViewController.h"
#import "SBBaseBookTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "SBBookDetailViewController.h"

@interface SBBookListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation SBBookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUP];
    // Do any additional setup after loading the view.
}

- (void)setUP {
    
    self.viewModel = [[SBBookViewModel alloc] init];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl layoutIfNeeded];
    
//    if (@available(iOS 10, *)) {
        [self.tableView setRefreshControl:self.refreshControl];
//    } else {
//        [self.tableView addSubview:self.refresh];
//    }
    
     [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
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
    cell.thumbnailImageView.image = nil;
    [cell.thumbnailImageView setImageWithURL:[self.viewModel thumbNailURL:indexPath]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SBBookDetailViewController *detailController = [[UIStoryboard storyboardWithName:@"SBBookDetailViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    [detailController loadViewIfNeeded];
    [detailController requestDetail:[self.viewModel isbn13:indexPath]];
    detailController.title = [self.viewModel title:indexPath];
    
    [self.navigationController pushViewController:detailController animated:YES];
}
- (void)refresh {
    
}

@end
