//
//  SBBookDetailViewController.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookDetailViewController.h"
#import "SBDetailBookCell.h"
#import "SBBookDetailViewModel.h"
#import "UIImageView+AFNetworking.h"
#import "SBDetailBookTableViewCell.h"

@interface SBBookDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) SBBookDetailViewModel *viewModel;


@property (nonatomic, strong) NSArray<NSString *> *sectionTitle;
@end

@implementation SBBookDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUP];
    // Do any additional setup after loading the view.
}

- (void)setUP {
    self.viewModel = [[SBBookDetailViewModel alloc] init];
    self.sectionTitle = @[@"Book",@"Description",@"Information",@"Pdf"];
    CGRect frame = CGRectZero;
    frame.size.height = CGFLOAT_MIN;
    
    [self.tableView setTableHeaderView:[[UIView alloc] initWithFrame:frame]];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];

    [self.navigationItem setLargeTitleDisplayMode:UINavigationItemLargeTitleDisplayModeNever];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 50;
    [self.tableView setHidden:YES];
}


- (void)requestDetail:(NSString *)isbn13 {
    [self.viewModel requestBookWithBookID:isbn13 completion:^(BOOL success, NSError * _Nonnull error) {
        if(success) {
            [self.tableView setHidden:NO];
            [self.tableView reloadData];
        } else {
            NSLog(@"error = %@",error.description);
//            UIAlertCon
        }
    }];
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
    NSArray *arr = self.viewModel.arrayWithDictionary;
    switch(section) {
        case 0:
        {
            return 1;
        }
        case 1:
        {
            return 1;
        }
        case 2:
        {
            return arr.count;
        }
        case 3:
        {
            return self.viewModel.pdf.allKeys.count;
        }
    }
    return 0;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.viewModel.pdf != nil) {
        return self.sectionTitle.count;
    } else {
        return self.sectionTitle.count - 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitle[section];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            SBDetailBookCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailBookCell" forIndexPath:indexPath];
            cell.titleLabel.text = self.viewModel.title;
            cell.subTitleLabel.text = self.viewModel.subTitle;
            [cell.bookThumbnailImageView setImageWithURL:self.viewModel.thumbnailURL];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        }
        case 1:
        {
            SBDetailBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell" forIndexPath:indexPath];
            cell.descLabel.text = self.viewModel.desc;
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        }
        case 2:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"informationCell" forIndexPath:indexPath];
            NSDictionary *information = self.viewModel.arrayWithDictionary[indexPath.row];
            cell.textLabel.text = information.allKeys[0];
            cell.detailTextLabel.text = information.allValues[0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
        }
        case 3:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"informationCell" forIndexPath:indexPath];
            NSDictionary *information = self.viewModel.pdf;
            NSString *key = information.allKeys[indexPath.row];
            cell.textLabel.text = key;
            cell.detailTextLabel.text = information[key];
            return cell;
            
        }
    }
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"default"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([self.sectionTitle[indexPath.section] isEqualToString:@"Pdf"]) {
        
        NSString *key = self.viewModel.pdf.allKeys[indexPath.row];
        NSString *url = self.viewModel.pdf[key];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url] options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
}

@end
