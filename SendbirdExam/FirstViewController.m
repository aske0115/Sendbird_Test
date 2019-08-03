//
//  FirstViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 29/07/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "FirstViewController.h"
#import "SBAPIManager.h"
#import "SBRequestQuery.h"

@interface FirstViewController ()
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end 

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestAPI];
}

- (void)requestAPI {
    SBRequestQuery *query = [[SBRequestQuery alloc] initWithQuery:@"mongoDB"];
    ;
    [[SBAPIManager shared] requestWithQuery:[query query:requestNew] completion:^(SBBaseBookModel * _Nonnull model) {
        NSLog(model);
    }];
}


@end
