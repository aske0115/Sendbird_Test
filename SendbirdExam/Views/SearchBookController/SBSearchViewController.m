//
//  SecondViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 29/07/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBSearchViewController.h"
#import "SBSearchKeywordViewModel.h"
#import "SBSearchBookResultViewController.h"

@interface SBSearchViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,UISearchResultsUpdating>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SBSearchKeywordViewModel *viewModel;
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation SBSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUP];
    [self initSearchController];
    // Do any additional setup after loading the view.
}

- (void)setUP {

    self.viewModel = [[SBSearchKeywordViewModel alloc] init];
    
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

- (BOOL)isFiltering {
    return self.searchController.isActive && self.searchController.searchBar.text.length != 0;
}

- (void)initSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.delegate = self;
    self.searchController.obscuresBackgroundDuringPresentation = false;
    self.searchController.searchBar.placeholder = @"Search Books";
    self.navigationItem.searchController = self.searchController;
    self.navigationItem.hidesSearchBarWhenScrolling = NO;
    self.definesPresentationContext = YES;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if([self isFiltering]) {
        return [self.viewModel prefixKeyword:self.searchController.searchBar.text].count;
    } else {
        return self.viewModel.keywords.count;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recentSearchKeywordCell" forIndexPath:indexPath];
    if([self isFiltering]) {
        cell.textLabel.text = [self.viewModel prefixKeyword:self.searchController.searchBar.text][indexPath.row];
    } else {
        cell.textLabel.text = self.viewModel.keywords[indexPath.row];
    }
    
    return cell;
}


- (void)showResultViewController:(NSString *)keyword {
    SBSearchBookResultViewController *result = (SBSearchBookResultViewController *)[[UIStoryboard storyboardWithName:@"SBSearchBookResultViewController" bundle:nil] instantiateViewControllerWithIdentifier:@"BookListViewController"];
    [result loadViewIfNeeded];
    result.title = keyword;
    [self.navigationController pushViewController:result animated:YES];
    [result requestSearch:keyword];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self isFiltering]) {
        [self showResultViewController:[self.viewModel prefixKeyword:self.searchController.searchBar.text][indexPath.row]];
    } else {
        [self showResultViewController:self.viewModel.keywords[indexPath.row]];
    }
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if(searchBar.text.length != 0) {
        [self.viewModel saveSearchKeyword:searchBar.text];       
        [self showResultViewController:searchBar.text];
         [self.searchController setActive:NO];
    }
}
@end
