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

@interface NewBookViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray<SBBookModel *> *model;
@end 

@implementation NewBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self registerTableViewCell];
    [self requestAPI];
}

- (void)registerTableViewCell {
//    [self.tableView registerClass:[SBBaseBookTableViewCell class] forCellReuseIdentifier:@"newBookCell"];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)requestAPI {
    [[SBAPIManager shared] requestNewBook:^(SBBaseBookModel * _Nonnull model) {
//        self.model = model.books;
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            weakSelf.model = model.books;
            [weakSelf.tableView reloadData];
        });
        
//        for (SBBookModel *book in model.books) {
//            NSLog(@"books = %@",book.title);
//        }
//        NSLog(model.books[0].title);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SBBaseBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookCell"];
    if (cell == nil) {
        
        
    }
    SBBookModel *model = self.model[indexPath.row];
    [cell configureCell:model];
//    cell.textLabel.text = model.title;
    return cell;
}

@end
