//
//  SBDetailHeaderView.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBDetailBookCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subTitleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *bookThumbnailImageView;
@end

NS_ASSUME_NONNULL_END
