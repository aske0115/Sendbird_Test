//
//  SBBaseBookTableViewCell.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 05/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBBookModel.h"
#import <AFNetworking/AFNetworking.h>
NS_ASSUME_NONNULL_BEGIN

@interface SBBaseBookTableViewCell : UITableViewCell


- (void)configureCell:(SBBookModel *)model;
@end

NS_ASSUME_NONNULL_END
